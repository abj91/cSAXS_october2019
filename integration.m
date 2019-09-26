clc; clear all, close all
testfile = '/Users/ale/Library/Mobile Documents/com~apple~CloudDocs/PhD/Sideprojekter/cSAXS_2019_10_SASTT/tmpFiles/CeO2_1100mm_0000.edf';

data = rf(testfile);
[mask, EX, Radius, Azi, MaskingThreshold, scaling] = getSettings();

IntIdx = MatFRAIA.indexing(mask, scaling, MaskingThreshold, EX, Radius, Azi);

Im = reshape(data, [size(data,1)*size(data,2),size(data,3)] );
IntIm = MatFRAIA.integrate(IntIdx,Im);

figure;
imagesc(IntIm.'); 
%caxis([0 10000])














%% Subfunctions
function [mask, EX, Radius, Azi, MaskingThreshold, scaling] = getSettings()
    
    testfile = '/Users/ale/Library/Mobile Documents/com~apple~CloudDocs/PhD/Sideprojekter/cSAXS_2019_10_SASTT/tmpFiles/CeO2_1100mm_0000.edf';
    mask = rf(testfile) > 0;
    EX.tilt.axis = 0;
    EX.tilt.delta = 0;
    EX.pix.size = 0.172;
    EX.detector.distance = 1100;
    MaskingThreshold = 0.9999;
    scaling = 2;
    EX.center.x = 1679/2;
    EX.center.y = 1475/2;
    
    %EX.center.x = 766.0
    %EX.center.y = 718.3
    
    Radius.min = 0;
    Radius.max = 8;
    Radius.N = 1100;
    Azi.min = 0;
    Azi.max = 2*pi;
    Azi.N = 16;
end