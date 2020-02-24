clc; clear all; close all;

%denoising image using median filtering
I=imread('cameraman.tif');
%I=rgb2gray(I);   %this function is only to be used for 3-dimensional images
figure,imshow(I)
J=imnoise(I,'gaussian',0.02,0.01);
subplot(3,3,1);
imshow(J);
title('Added guusian noise image');

A=medfilt2(J);
subplot(3,3,2);
imshow(A);
title('Median filter');
A=double(A);
mse=std(A(:));
ima=max(A(:));
imi=min(A(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of median filter:%0.5f',snr);

B=wiener2(J,[2 5]);
subplot(3,3,3);
imshow(B);
title('Wiener filter');
B=double(B);
mse=std(B(:));
ima=max(B(:));
imi=min(B(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of wiener filter:%0.5f',snr);

C=imgaussfilt(J,2);
subplot(3,3,4);
imshow(C);
title('Gaussian filter');
C=double(C);
mse=std(C(:));
ima=max(C(:));
imi=min(C(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of gussian filter:%0.5f',snr);

D=imbilatfilt(J,2,6);
subplot(3,3,5);
imshow(D);
title('Bilateral filter');
D=double(D);
mse=std(D(:));
ima=max(D(:));
imi=min(D(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of biateral filter:%0.5f',snr);

E=imguidedfilter(J);
subplot(3,3,6);
imshow(E);
title('Guided filter');
E=double(E);
mse=std(E(:));
ima=max(E(:));
imi=min(E(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of guided filter:%0.5f',snr);

fun=@(J) median(J(:));
F=nlfilter(J,[5 3],fun);
subplot(3,3,7);
imshow(F);
title('Non-local means-based filter');
F=double(F);
mse=std(F(:));
ima=max(F(:));
imi=min(F(:));
snr=20*log10((ima-imi)/mse);
fprintf('\n SNR value of non-local means-based filter:%0.5f',snr);
