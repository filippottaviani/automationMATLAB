% Calcolo jacobiano e singolarità polso sferico RRR
syms q4 q5 q6 real;

% Matrice dei parametri
DH = [0 -pi/2 0 q4 'r'; 0 pi/2 0 q5 'r';0 0 0 q6 'r'];

% Calcolo dello jacobiano e del suo minore
J = DHtoJ(DH);
J1 = [J(4,1) J(4,2) J(4,3); J(5,1) J(5,2) J(5,3); J(6,1) J(6,2) J(6,3)];
disp(J1);

% Rango dello jacobiano
rJ1 = rank(J1);
str = ['Il rango dello jacobiano è ',num2str(rJ1)];
disp(str);

% Ricerca delle singolarità
detJ1 = simplify(det(J1));
disp('Il determinante dello jacobiano è: ');
disp(detJ1);