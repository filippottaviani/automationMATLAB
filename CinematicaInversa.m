% Definisco le variabili, la matrice S e il vettore r
syms theta rx ry rz real;
S=[0 -rz ry; rz 0 -rx;-ry rx 0];
r=[rx;ry;rz];

% Definisco la matrice per asse-angolo
R=r*r'+(eye(3)-r*r')*cos(theta)+S*sin(theta);

Rz=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Rx=[1 0 0; 0 cos(theta),-sin(theta);0, sin(theta), cos(theta)];

Px=[rx;0;0];
Pz=[0;0;rz];
Tx=[Rx,Px;0 0 0 1];
Tz=[Rz,Pz;0 0 0 1];

T=Tz*Tx;