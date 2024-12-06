% Bilanco statico RR planare
syms q1 q2 real

bRa = [-1 0;0 -1];
aFa = [(2^(1/2))/2;(2^(1/2))/2];
F = 10;
l1 = 1;
l2 = 1;

% Calcolo dello jacobiano
f = [l1*cos(q1)+l2*cos(q1+q2); l1*sin(q1)+l2*sin(q1+q2)];
J = jacobian(f);

% Calcolo dello jacobiano nelle sezioni a e b 
Ja = subs(J,[q1,q2],[(3/4)*pi,-pi/2]);
Jb = subs(J,[q1,q2],[pi/2,-pi/2]);

% Forza applicata su b
bFb = bRa*(aFa)*10;

% Ricavo tau
tau_a = Ja*aFa;
tau_b = Jb*bFb;
disp(tau_a);
disp(tau_b);
