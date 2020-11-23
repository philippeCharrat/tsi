 clc;clear variables;close all;

%Récupération de l'image
Image = im2double(imread("Images/journal.png"));
[h,w] = size(Image); 
 

%Initialisation des paramètres du filtres
n = 2;
fc = 100;
B = 120;
%Récupération des coordonnées des pixels, la fréquence nulle étant placée au centre de
%l'image
[U V] = meshgrid(-w/2+1/2:w/2-1/2,-h/2+1/2:h/2-1/2);
%Calcul de la distance au centre de chacun des pixels
D = sqrt(U.*U + V.*V);
%Création du filtre de Butterworth
H = 1./(1+(((B*D)./(D.*D - fc^2))).^(2*n));
%Réalisation de la fft en 2D de notre image puis ajustement afin de centrer
%le 0
tfIm = fft2(Image);
tfIm = ifftshift(tfIm);
%Passage dans le filtre, puis réajustement
Im_filtre_freq = H.*tfIm;
Im_filtre_freq = fftshift(Im_filtre_freq);
%fft inverse pour récupérer l'image filtrée
Im_filtre = ifft2(Im_filtre_freq);

%Tracé du filtre de butterworth
figure(1)
mesh(H);
title('Filtre de butterworth')
%Affichage de l'image originale et celle filtrée
figure(2)
subplot 121
imshow(Image,[])
title('Image originale')
subplot 122
imshow(Im_filtre,[])
title('Image filtree')










