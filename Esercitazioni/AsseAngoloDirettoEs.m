%Assi coordinati
r_x = [1;0;0];
r_y = [0;1;0];
r_z = [0;0;1];

% Angolo di rotazione
theta = pi/3;

% Vettore da ruotare
v = [1;2;3];

%Matrici di rotazione
R_x = r_x*r_x'+(eye(3)-r_x*r_x')*cos(theta)+veeOperator(r_x)*sin(theta); % Matrice di rotazione intorno a x
R_y = r_y*r_y'+(eye(3)-r_y*r_y')*cos(theta)+veeOperator(r_y)*sin(theta); % Matrice di rotazione intorno a y
R_z = r_z*r_z'+(eye(3)-r_z*r_z')*cos(theta)+veeOperator(r_z)*sin(theta); % Matrice di rotazione intorno a z

% Rotazione di un vettore di esempio attorno agli assi coordinati
v_x = R_x*v; % Rotazione di v intorno a x
v_y = R_y*v; % Rotazione di v intorno a y
v_z = R_z*v; % Rotazione di v intorno a z
