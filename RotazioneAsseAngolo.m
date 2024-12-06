% Vettore dell'asse di rotazione
axis = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]'; % Asse di rotazione normalizzato

% Angolo di rotazione
angle = pi/3; % Angolo di rotazione in radianti

% Matrice di rotazione
c = cos(angle);
s = sin(angle);
t = 1 - c;
x = axis(1);
y = axis(2);
z = axis(3);
R = [t*x*x + c, t*x*y - s*z, t*x*z + s*y;
     t*x*y + s*z, t*y*y + c, t*y*z - s*x;
     t*x*z - s*y, t*y*z + s*x, t*z*z + c];
