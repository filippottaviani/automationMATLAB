% Disaccoppiamento polso-struttura portante del manipolatore di Stanford
syms q1 q2 q3 q4 q5 real

l1 = 1; % lunghezza del primo braccio
l2 = 1; % lunghezza del secondo braccio
l5 = 1; % lunghezza del quinto braccio

% Posizione della base del polso 
pwx = q3*cos(q2)*cos(q1);
pwy = q3*cos(q2)*sin(q1);
pwz = q3*sin(q2);

% Posizione del'end-effector
pex = sin(q4)*cos(q5);
pey = cos(q4)*cos(q5);
pez = sin(q5)*l1;

% Calcolo dello jacobiano della struttura portante 
fs =[pwx;pwy;pwz];
Js = jacobian(fs);

% Calcolo dello jacobiano del polso 
fe =[pex;pey;pez];
Je = jacobian(fe);
Je1 = [Je(1,1) Je(1,2);Je(2,1) Je(2,2)];

% Determinanti degli jacobiani
detS = det(Js);
detE = det(Je1);

disp(simplify(detS));
disp(simplify(detE));