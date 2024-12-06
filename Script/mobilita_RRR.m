% Analisi della mobilità del manipolatore planare RRR
syms q1 q2 q3 real;

% Matrice dei parametri di Denavit-Hartenberg
DH = [1 0 0 q1 'r';1 0 0 q2 'r'; 1 0 0 q3 'r'];

% Calcolo dello jacobiano
J = DHtoJ(DH);
disp(J);
Jmin = [J(1,1) J(1,2) J(1,3);J(2,1) J(2,2) J(2,3)];
disp(simplify(Jmin));

% Sostituzione di terne di variabili
J_1 = subs(Jmin, [q1, q2, q3], [0, pi/2, pi/2]);
J_2 = subs(Jmin, [q1, q2, q3], [pi/2 0 pi]);
disp(J_1);
disp(J_2);

% Calcolo dei ranghi
rankJ_1=rank(J_1);
rankJ_2=rank(J_2);

% Stampa del risultato
str = ['Il rango dello jacobiano della prima configurazione è ',num2str(rankJ_1),' e per la seconda è ',num2str(rankJ_2) ];
disp(str);

% Ricerca delle direzioni in cui il manipolatore non può muoversi
nullJ_1T = null(J_1'); 
disp('Il movimento non accessibile nella prima configurazione è ')
disp(nullJ_1T);
nullJ_2T = null(J_2'); 
disp('Il movimento non accessibile nella seconda configurazione è ')
disp(nullJ_2T);

% Ricerca del nullo dello jacobiano
nullJ_1 = null(J_1);
disp('Il nullo dello jacobiano della prima configurazione è ')
disp(nullJ_1);
nullJ_2 = null(J_2);
disp('Il nullo dello jacobiano della seconda configurazione è ')
disp(nullJ_2);

% Divisione di J in 2 minori
Jmin1 = [Jmin(1,1) Jmin(1,2);Jmin(2,1) Jmin(2,2)];
Jmin2 = [Jmin(2,1) Jmin(2,2);Jmin(1,3) Jmin(2,3)];

% Ricerca delle singolarità nel primo minore di J
detJ1= det(Jmin1);
disp('Il determinante del primo minore di J è ')
disp(detJ1);
sol1 = vpasolve(detJ1,[q1, q2, q3]);
disp('e la configurazione che lo annulla è: ')
disp(sol1);

% Ricerca delle singolarità nel secondo minore di J
detJ2= simplify(det(Jmin2));
disp('Il determinante del secondo minore di J è ')
disp(detJ2);
sol2 = vpasolve(detJ2,[q1, q2, q3]);
disp('e la configurazione che lo annulla è: ')
disp(sol2);
