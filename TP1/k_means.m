function [matrice_label,tab_mi_o,tab_mi] = k_means(matrice_double,k)
  % 
  tab_mi = abs(sort(rand(1,k)))
  tab_mi_o = tab_mi;
  [H,W] = size(matrice_double);
  matrice_label = zeros(H,W);
  s_1 = 0;
  m = 0; 
  m_1 = 1;
  while ( abs(m_1-m) > 0.001)   
      tab_mi
    for i=1:H
      for j=1:W
        for l=1:k
          if (abs(tab_mi(l) - matrice_double(i,j)) > abs(s_1 - matrice_double(i,j)))
            matrice_label(i,j) = l-1;
            s_1 = 0;
            break
          else 
            s_1 = tab_mi(l);
          end
        end
      end
    end
  
    
    for l=1:k
      tab_mi(l) = mean(matrice_double(matrice_label == l-1));
    end
    m_1 = m;
    m = tab_mi(1); 
    abs(m-m_1);
end
  
end
