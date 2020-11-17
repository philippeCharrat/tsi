clc;clear variables;close all;

PLANCHER = im2double(imread("Images/flower.png"));
J = imnoise(PLANCHER,'gaussian',0,0.01);
[h,w] = size(PLANCHER);

%PLANCHER !

filtre_lissage = 0.25*[1;2;1];
derivation_h = 0.5*[-1,0,1];
derivation_v = derivation_h';

sobel_h = filtre_lissage * derivation_h;
sobel_v = derivation_v * filtre_lissage';

Gv = filter2(sobel_v,J);
Gh = filter2(sobel_h,J);
%Norme du gradient
G = sqrt(Gv.*Gv+Gh.*Gh);


figure(2)
subplot 131
imshow(G,[])
colorbar
title("Norme")
subplot 132
imshow(Gh,[])
colorbar
title("Gradient horizontal")
subplot 133
imshow(Gv,[])
colorbar
title("Gradient vertical")



Gv_n = Gv./(G+0.000001);
Gh_n = Gh./(G+0.000001);



