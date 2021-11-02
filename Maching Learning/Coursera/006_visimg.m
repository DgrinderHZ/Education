clear;
clc;
clf;
disp("Hello World");
A = magic(5);
subplot(1,2,1);
imagesc(A);
subplot(1,2,2);
imagesc(A), colorbar, colormap;