clc;
clear all;
close all;
[data,Fs]=audioread('test.wav');
Lengthaudio = length(data);
t=0:1:Lengthaudio-1;
 
 
figure
plot(t,data);
title('masukan suara');
xlabel('jumlah sampel');
ylabel('Amplitudo');
axis tight