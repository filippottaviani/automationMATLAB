function J = jacobiano_geometrico(DH)
% DH è la matrice dei parametri di Denavit-Hartenberg
% J è il jacobiano geometrico

% Inizializzazione delle variabili
n = size(DH,1);
J = sym(zeros(6,n));

% Calcolo del jacobiano geometrico
for i=1:n
    % Matrice di trasformazione omogenea
    T = eye(4);
    for j=1:i-1
        T = T * dh(DH(j,:));
    end
    % Asse di rotazione e vettore di traslazione
    z = T(1:3,3);
    p = T(1:3,4);
    % Calcolo della colonna del jacobiano geometrico
    J(:,i) = [cross(z,p); z];
end

end

function T = dh(dh_params)
% dh_params è un vettore con i parametri di Denavit-Hartenberg 
% T è la matrice di trasformazione omogenea corrispondente

a = dh_params(1);
d = dh_params(3);
alpha = dh_params(2);
theta = dh_params(4);

T = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta);
     sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
     0 sin(alpha) cos(alpha) d;
     0 0 0 1];
end