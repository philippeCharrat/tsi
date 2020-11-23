clc;
close all;
clear variables;

% ------
% But : Filtrage de l'histogramme 
% Auteur : Philippe CHARRAT & Axel BRUYERE 
% ------

PLANCHER = im2double(imread("Images/flower.png"));
[closest,tab_mi,matrice_label] = k_means2(PLANCHER,10);
figure(1)
subplot 121
imshow(PLANCHER,[]);
title("Image d'origine")
colorbar
subplot 122
imshow(matrice_label,[]);
title("Image modélisées par la méthode des k-means")
colorbar
