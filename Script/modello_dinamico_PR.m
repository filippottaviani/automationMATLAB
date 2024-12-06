% Modello dinamico robot PR
syms q1 q2 qdot1 qdot2 d m1 m2 I t qdotdot real 

% Posizione dell'end-effector
px = q1+d*cos(q2);
py = d*sin(q1);
pz = 0;

% Velocità dell'end-effector
vx = qdot1-d*sin(q2)*qdot2;
vy = d*cos(q2)*qdot2;
vz = 0;
omegax = 0;
omegay = 0;
omegaz = qdot2;
v = [vx;vy;vz];
omega = [omegax;omegay;omegaz];
qdot = [qdot1;qdot2];
q = [q1;q2];

% Energia cinetica
T1 = (1/2)*m1*qdot1^2;
T2 = (1/2)*m2*v'+(1/2)*(omega'*I*omega);
T = T1 + T2;

% Matrice d'inerzia generalizzata
M = [m1+m2 -m2*d*sin(q2);-m2*d*sin(q2) I+m2*d^2];

% Coefficienti di Coriolis
C1 = (1/2)*([0 0; 0 -m2*d*cos(q2)]+[0 0;0 -m2*d*cos(q2)]+[0 0;0 0]);
C2 = (1/2)*([0 -m2*d*cos(q2);0 0]+[0 0;-m2*d*cos(q2) 0]-[0 -m2*d*cos(q2);-m2*d*cos(q2) 0]);
c = [qdot'*C1*qdot ; qdot'*C2*qdot];

% Relazione fondamentale della dinamica
u = M*qdotdot+c;

disp(u);
