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


d = 2;
i = 1:h;
j = 1:w;

[I,J] = meshgrid(i,j);
I1 = round(I + d*Gv_n);
I1 = double(I1.*(I1<=w) + w .* I1>w);
I2 = round(I-d*Gv_n);
I2 = I2 .*(I2>=1) + (I2<1);

J1 = round(J-d*Gv_n);
J1 = J1 .*(J1>=1) + (J1<1);
J2 = round(J-d*Gv_n);
J2 = J2 .*(J2>=1) + (J2<1);

eps = 0.5;
C = zeros(h,w);

for n = 1:1:w
    for m = 1:1:h
        I1_ = I1(m,n)
        J1_ = J1(m,n)
        if ((((G(m,n) - G(I1(m,n),J1(m,n)))>eps) && ((G(m,n) - G(I2(m,n), J2(m,N)))>eps)))
            C(m,n) = G(m,n);
        end
    end 
end
