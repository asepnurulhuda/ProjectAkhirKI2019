clc
clear all
close all
sel=input('Pilih Menu : \n 1- Berdasarkan File \n 2- Rekaman Langsung \n Masukan Pilihan:');
if sel==1
%     file=uigetfile({'*'}); % get input file
    [A,fs,nbits] = wavread('host_new3.wav'); % read the audio wave
       %sound(A,fs);
   %info = audioinfo('test.wav')
elseif sel==2
    t=5; % time in seconds
    fs=44100; % % sampling rate
    recobj=audiorecorder(fs,8,1);
    recordblocking(recobj, t);
    play(recobj)
    A = getaudiodata(recobj);
end

% A=A(1:15000);
figure(1)
subplot(2,1,1)
plot(A)
title('Audio Original')
%% embedding watremark loaded
I=imread('_copyright.bmp'); % read watermark image
I=im2bw(I);
figure(2)
subplot(1,2,1)
imshow(I)
title('File Watermark')
[row,colm]=size(I);
watermark=imresize(I,[1,row*colm]);
%% condition check
if numel(watermark)>numel(A)
    errordlg('Watermark Message is too large to be embedded')
end
%% sampling of input audio in frames
dwtlevel=4; % % Level for DWT 
cnt=1;% initilaisation of counter variable
ind=1; % counter started to pick the element from the original image vector
message_chunks=(numel(watermark)/(dwtlevel^2-dwtlevel));
signalinframe=numel(A)/(message_chunks);
iter= message_chunks;
gain=3;
[finalwatermrked,U11,V11]=embedding(gain,A,watermark,signalinframe,iter,dwtlevel);

%[out save_dir] = generateTestData(data_loc,n,len,[save,r])
figure(1)
subplot(2,1,2)
plot(finalwatermrked)
axis tight
title('Audio Hasil Watermark')
%wavwrite(y_enc,44100,32,'new_audio.wav')
%% evaluation for embedding
 originalframe=A(1:numel(finalwatermrked));
 [MSE,PSNR]=evelauation( originalframe,finalwatermrked); % evaluation for embedded audio signal
% display(['Normalised cross correlation = ', num2str(NCC)])
disp(['PSNR Peak Signal to Noise Ratio = ', num2str(PSNR)]);
disp(['Mean Squaer Error = ', num2str(MSE)]);
