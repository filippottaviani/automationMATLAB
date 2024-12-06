%Relazione tra vettore velocità angolare e derivate deglia angoli RPY
syms phi psi theta real

% Matrici di rotazione RPY
Rx = [1 0 0; 0 cos(psi) -sin(psi); 0 sin(psi) cos(psi)]; % Rotazione sull'asse x ROLL
Ry = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; % Rotazione sull'asse y PITCH
Rz = [cos(phi) -sin(phi) 0; sin(phi) cos(phi) 0; 0 0 1]; % Rotazione sull'asse z YAW

% Derivazione delle matrici
Rdotx = diff(Rx,psi);
Rdoty = diff(Ry,theta);
Rdotz = diff(Rz,phi);

% Calcolo le matrici antisimmetriche
Sx = simplify(Rdotx*Rx');
Sy = simplify(Rdoty*Ry');
Sz = simplify(Rdotz*Rz');

% Ricavo le omega
omegax = psi*[Sx(2,3);Sx(1,3);Sx(1,2)];
omegay = theta*[Sy(2,3);Sy(1,3);Sy(1,2)];
omegaz = phi*[Sz(2,3);Sz(1,3);Sz(1,2)];

disp(omegax);
disp(omegay);
disp(omegaz);