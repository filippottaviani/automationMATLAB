% ALGORITMO ITERATIVO DI NEWTON PER MANIPOLATORE RR PLANARE

% Dichiaro le variabili simboliche
syms q1 q2 real

% Inizializzazione del robot RR planare
L1 = 1; % lunghezza del primo braccio
L2 = 1; % lunghezza del secondo braccio
q = [1; 1]; % posizione iniziale del primo giunto

% Definizione della posizione desiderata del polso
r = [sqrt(2) ; sqrt(2)];

% Inizializzazione dei parametri dell'algoritmo del gradiente
tol = 1e-9; % tolleranza
max_iter = 10000; % numero massimo di iterazioni

% Iterazione dell'algoritmo di Newton
for i = 1:max_iter
    % Calcolo dello Jacobiano
    J = [-L1*sin(q(1))-L2*sin(q(1)+q(2)), -L2*sin(q(1)+q(2)); L1*cos(q(1))+L2*cos(q(1)+q(2)), L2*cos(q(1)+q(2))]; % Jacobiano del robot RR planare
    f = [L1*cos(q(1))+L2*cos(q(1)+q(2)); L1*sin(q(1))+L2*sin(q(1)+q(2))];

    % Calcolo dell'incremento delta_q
     delta_q = r - f;
    
    % Aggiornamento della posizione del giunto secondo Newton
     q = q + (inv(J))*(delta_q);
    
    %Verifica della convergenza
    if delta_q(1) < tol && delta_q(2) < tol
        break;
    end
end

% Stampa della posizione finale del giunto
disp(['q1 = ', num2str(q(1)), ', q2= ', num2str(q(2))]);

% Prova
x = L1*cos(q(1))+L2*cos(q(1)+q(2));
y = L1*sin(q(1))+L2*sin(q(1)+q(2));
r_p = [x;y]; % posizione ottenuta dalla cinematica inversa
disp(r_p);