% Analisi manipolabilità manipolatore RR planare
syms q1 q2 real

% Sistema che determina le coordinte dell'end-effector
f = [cos(q1)+cos(q1+q2);sin(q1)+sin(q1+q2)];

% Calcolo dello jacobiano
J = jacobian(f);

% Calcola il volume dell'ellissoide di manipolabilità
w = simplify(sqrt(det(J*J')));
disp (w);

% Il manipolatore non è risondante quindi posso calcolare il volume anche
% così
w1 = simplify(abs(det(J)));
disp(w1);

