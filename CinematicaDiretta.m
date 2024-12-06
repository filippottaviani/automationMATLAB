% Definisco i parametri di Denavit-Hartenberg
syms Px Py Pz q1 q2 q3 l1 l2 l3 phi1 phi2 phi3 real;

% Definisco la matrice dei parametri
DH=[-pi/2 0 0 q1;pi/2 0 l2 q2;0 0 q3 0]; %esempio
alpha1=DH(1,1);
alpha2=DH(2,1);
alpha3=DH(3,1);
a1=DH(1,2);
a2=DH(2,2);
a3=DH(3,2);
d1=DH(1,3);
d2=DH(2,3);
d3=DH(3,3);
theta1=DH(1,4);
theta2=DH(2,4);
theta3=DH(3,4);

% Definisco le matrici di rotazione 
R1x = [1,0,0;0,cos(alpha1),-sin(alpha1); 0, sin(alpha1), cos(alpha1)];
R2x = [1,0,0;0,cos(alpha2),-sin(alpha2); 0, sin(alpha2), cos(alpha2)];
R3x = [1,0,0;0,cos(alpha3),-sin(alpha3); 0, sin(alpha3), cos(alpha3)];

R1z = [cos(theta1), -sin(theta1),0; sin(theta1), cos(theta1),0;0,0,1];
R2z = [cos(theta2), -sin(theta2),0; sin(theta2), cos(theta2),0;0,0,1];
R3z = [cos(theta3), -sin(theta3),0; sin(theta3), cos(theta3),0;0,0,1];

% Definisco i vettori posizione
p1x = [a1; 0; 0];
p2x = [a2; 0; 0];
p3x = [a3; 0; 0];

p1z = [0; 0; d1];
p2z = [0; 0; d2];
p3z = [0; 0; d3];

% Definisco la matrici di trasformazione omogenee per ogni braccio rispetto a x
T1x = [R1x, p1x; 0 0 0 1];
T2x = [R2x, p2x; 0 0 0 1];
T3x = [R3x, p3x; 0 0 0 1];

% Definisco la matrici di trasformazione omogenee per ogni braccio rispetto a z
T1z = [R1z, p1z; 0 0 0 1];
T2z = [R2z, p2z; 0 0 0 1];
T3z = [R3z, p3z; 0 0 0 1];

% Calcolo la matrice di trasformazione omogena per ogni braccio
T1= T1z*T1x;
T2= T2z*T2x;
T3= T3z*T3x;

% Calcolo la matrice di trasformazione omogenea complessiva
T = T1 * T2 * T3;

% Definisco le coordinate dell'oggetto rispetto alla terna base
P_base = [Px; Py; Pz; 1];

% Utilizzo la matrice di trasformazione complessiva per ottenere la terna relativa all'end-effector
P_end_effector = T * P_base;