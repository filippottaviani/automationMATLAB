function [out] = DHtoJ(DH)

% Inizializzazione delle variabili
n = size(DH, 1);
J = sym(zeros(6,n));
T = eye(4);
tipo = DH(:,5);
z = [0;0;1];
p = [0;0;0];
pEi = [];

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
      
    % Calcolo T ed estraggo z e p
    T = simplify(T * Ti);
    z = [z,T(1:3,3)]; % Terza colonna meno l'ultimo elemento
    p = [p,T(1:3,4)]; % Quarta colonna meno l'ultimo elemento
end

% Ricavo la posizione dell'end-effector dalla matrice 0Te (quella che esce
% dal ciclo)
pE = [T(1:3,4)];

for i = 1:n
    pEi = [pEi,pE - p(:,i)]; % Ricavo la posizione relativa ad i dell'end-effector
end

for i = 1:n
    % Calcolo della i-esima colonna dello jacobiano   
    
    if tipo(i) == 'r' % Giunto rotoidale 
        J(:,i) = [cross(z(:,i),pEi(:,i)); z(:,i)]; 
    end

    if tipo(i) == 'p' % Giunto prismatico
        J(:,i) = [z(:,i); 0; 0; 0];
    end
     
end

out = simplify(J);
end