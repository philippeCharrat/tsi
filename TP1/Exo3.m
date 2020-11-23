 clc;clear variables;close all;

PLANCHER = im2double(imread("Images/flower.png"));
[h,w] = size(PLANCHER);

Im_bruitee = imnoise(PLANCHER,'salt & pepper',0.5);

figure(1)
subplot 131
imshow(PLANCHER,[])
subplot 132
imshow(Im_bruitee,[])

Im_filtree = ordfilt2(Im_bruitee,50,ones(10));

subplot 133
imshow(Im_filtree,[])
