clc;
close all;
clear variables;

% ------
% But : Filtrage de l'histogramme 
% Auteur : Philippe CHARRAT & Axel BRUYERE 
% ------

PLANCHER = im2double(imread("Images/flower.png"));
[matrice_label,tab_mi_o,tab_mi] = k_means(PLANCHER,2);
imshow(matrice_label,[]);