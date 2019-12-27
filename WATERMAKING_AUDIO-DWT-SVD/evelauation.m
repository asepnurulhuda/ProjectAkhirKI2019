% function [MSE,PSNR]=evelauation(A,finalwatermrked)
% originalframe=A(1:numel(finalwatermrked));
% % PSNR & MSE Calculation
% Id     = (originalframe-finalwatermrked);
% signal = sum(sum(originalframe.^2));
% noise  = sum(sum(Id.^2));
% MSE  = noise./numel(originalframe);
% peak = max(A(:));
% PSNR= 10*log10(peak^2/MSE);
% disp(['PSNR Peak Signal to Noise Ratio = ', num2str(PSNR)]);
% disp(['Mean Squaer Error = ', num2str(MSE)]);


function [MSE,PSNR]=evelauation(A,finalwatermrked)
originalframe=A(1:numel(finalwatermrked));
% NCC=ncc(finalwatermrked,originalframe); % normalised cross correlation
% display(['Normalised cross correlation = ', num2str(NCC)])
% PSNR & MSE Calculation
Id     = (originalframe-finalwatermrked);
signal = sum(sum(originalframe.^2));
noise  = sum(sum(Id.^2));
MSE  = noise./numel(originalframe);
peak = max(A(:));
PSNR= 10*log10(peak^2/MSE);
disp(['PSNR Peak Signal to Noise Ratio = ', num2str(PSNR)]);
disp(['Mean Squaer Error = ', num2str(MSE)]);

