% Algoritmo iterativo del gradiente manipolatore polare (RRP)

syms q1 q2 q3 real 

% Parametri manipolatore
l1 = 1;% lunghezza del primo braccio
l2 = 1; % lunghezza del secondo braccio
d1 = 0.5; 

% Posizione E-E
r = [0.5 2 -0.3]';

% Posizione iniziale manipolatore
q = [pi/3 pi/3 0.5]';

% Tolleranza e iterazioni
tol = 1e-6; % tolleranza
max_iter = 10000; % numero massimo di iterazioni
alpha = 0.1; % parametro alpha

% Controllo singolarità
if q(3)==0 || cos(q(2))==0
    disp('Configurazione singolare, q_3 ed il coseno di q_2 devono essere diversi da 0')

% Sezione iterativa
else
    for i = 1:max_iter

        % Calcolo del valore della funzione e del Jacobiano
        J = [-q(3)*sin(q(1))*cos(q(2)), -q(3)*cos(q(1))*sin(q(2)), cos(q(2))*cos(q(1)); q(3)*cos(q(2))*cos(q(1)), -q(3)*sin(q(2))*sin(q(1)), cos(q(2))*sin(q(1)); 0, q(3)*cos(q(2)), sin(q(2))];
        f = [q(3)*cos(q(2))*cos(q(1)); q(3)*cos(q(2))*sin(q(1)); d1+q(3)*sin(q(2))];

        % Calcolo dell'incremento delta_theta
        delta_q = r - f;
        
        % Aggiornamento della posizione del giunto
        q = q + alpha*(J.')*(delta_q);
        
        % Verifica della convergenza
        if delta_q < tol
            break;
        end
    end
end

% Stampa della posizione finale del giunto
disp(['q1 = ', num2str(q(1)), ', q2= ', num2str(q(2)),', q3= ', num2str(q(3))])

% Prova
x = q(3)*cos(q(2))*cos(q(1));
y = q(3)*cos(q(2))*sin(q(1));
z = d1+q(3)*sin(q(2));
r = [x y z];

% Stampa della prova
disp(['r_x = ', num2str(r(1)), ', r_y= ', num2str(r(2)),', r_z= ', num2str(r(3))]);