function [out] = DHtoT(DH)

 % Numero di bracci del manipolatore
    n = size(DH, 1);
    
 % Matrice di trasformazione iniziale
    T = eye(4);
    
 % Calcolo della matrice di trasformazione finale
    for i = 1:n
        theta = DH(i, 4);
        d = DH(i, 3);
        a = DH(i, 1);
        alpha = DH(i, 2);
        
        % Matrice di trasformazione i-esima
        Ti = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
              sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
              0, sin(alpha), cos(alpha), d;
              0, 0, 0, 1];
          
        % Aggiornamento della matrice di trasformazione finale
        T = T * Ti;
        out = simplify(T); 
    end
end