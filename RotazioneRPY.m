% Angoli di rotazione
roll = pi/2; % Rotazione sull'asse x (Roll)
pitch = pi/2; % Rotazione sull'asse y (Pitch)
yaw = pi/2; % Rotazione sull'asse z (Yaw)

% Matrici di rotazione
Rx = [1 0 0; 0 cos(roll) -sin(roll); 0 sin(roll) cos(roll)]; % Rotazione sull'asse x
Ry = [cos(pitch) 0 sin(pitch); 0 1 0; -sin(pitch) 0 cos(pitch)]; % Rotazione sull'asse y
Rz = [cos(yaw) -sin(yaw) 0; sin(yaw) cos(yaw) 0; 0 0 1]; % Rotazione sull'asse z

% Matrice di rotazione finale (RPY)
R = Rz * Ry * Rx;