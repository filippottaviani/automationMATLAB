% Angoli di rotazione
zeta = pi/2; % Rotazione intorno all'asse z
theta = pi/2; % Rotazione intorno all'asse y'
psi = pi/2; % Rotazione intorno all'asse z''

% Matrici di rotazione
Rzeta = [cos(zeta) -sin(zeta) 0; sin(zeta) cos(zeta) 0; 0 0 1]; % Rotazione intorno all'asse z
Ryprime = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]; % Rotazione intorno all'asse y'
Rzdoubleprime = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1]; % Rotazione intorno all'asse z''

% Matrice di rotazione finale (ZYZ)
R = Rzeta * Ryprime * Rzdoubleprime;
