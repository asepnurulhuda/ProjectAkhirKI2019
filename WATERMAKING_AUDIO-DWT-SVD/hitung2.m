[y1,fs1, nbits1,opts1]=wavread('test.wav');
[y2,fs2, nbits2,opts2]=wavread('test2.wav');
[c1x,c1y]=size(y1);
[c2x,c2y]=size(y1);
if c1x ~= c2x
    disp('dimeonsions do not agree');
 else
 R=c1x;
 C=c1y;
 err = (((y1-y2).^2)/(R*C));
 MSE=sqrt(err);
 MAXVAL=65535;
  PSNR = 20*log10(MAXVAL/MSE); 
  disp(['mse=' num2str(MSE) ' PSNR=' num2str(PSNR)]);
end