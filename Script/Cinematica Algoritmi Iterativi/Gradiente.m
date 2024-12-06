% Parametri del robot RR planare
L1 = 1; % Lunghezza del primo braccio
L2 = 1; % Lunghezza del secondo braccio

% Coordinate desiderate dell'end-effector
x_desiderato = sqrt(2); % Coordinate x desiderate
y_desiderato = sqrt(2); % Coordinate y desiderate

% Inizializzazione delle variabili
theta1 = pi/2; % Coordinata iniziale del primo giunto
theta2 = pi/2; % Coordinata iniziale del secondo giunto
alpha = 0.1; % Passo di apprendimento
num_iterazioni = 100; % Numero di iterazioni

% Inizializzazione delle variabili per il plot delle curve di livello
theta1_range = -pi:0.1:pi;
theta2_range = -pi:0.1:pi;
[X, Y] = meshgrid(theta1_range, theta2_range);
Z = zeros(size(X));

% Applicazione dell'algoritmo del gradiente
for iterazione = 1:num_iterazioni
    % Calcolo delle coordinate attuali dell'end-effector
    x_attuale = L1*cos(theta1) + L2*cos(theta1 + theta2);
    y_attuale = L1*sin(theta1) + L2*sin(theta1 + theta2);
    
    % Calcolo dell'errore tra le coordinate attuali e desiderate
    errore_x = x_desiderato - x_attuale;
    errore_y = y_desiderato - y_attuale;
    
    % Aggiornamento delle coordinate dei giunti tramite il gradiente
    delta_theta1 = alpha * (-L1*sin(theta1) - L2*sin(theta1 + theta2)) * errore_x + alpha * (L1*cos(theta1) + L2*cos(theta1 + theta2)) * errore_y;
    delta_theta2 = alpha * (-L2*sin(theta1 + theta2)) * errore_x + alpha * (L2*cos(theta1 + theta2)) * errore_y;
    
    theta1 = theta1 + delta_theta1;
    theta2 = theta2 + delta_theta2;
    
    % Calcolo dell'errore tra le coordinate attuali aggiornate e desiderate
    errore = norm([x_desiderato - (L1*cos(theta1) + L2*cos(theta1 + theta2)), y_desiderato - (L1*sin(theta1) + L2*sin(theta1 + theta2))]);
    fprintf('Iterazione %d: Errore = %.4f\n', iterazione, errore);
    
    % Calcolo dell'errore per il plot delle curve di livello
    for i = 1:numel(X)
        Z(i) = norm([x_desiderato - (L1*cos(X(i)) + L2*cos(X(i) + Y(i))), y_desiderato - (L1*sin(X(i)) + L2*sin(X(i) + Y(i)))]);
    end

    % Plot delle curve di livello
    figure(1);
    contour(X, Y, Z, 20);
    hold on;
    plot(theta1, theta2, 'ro-');
    hold off;
    xlabel('\theta_1');
    ylabel('\theta_2');
    title('Avvicinamento cinematica inversa');
    legend('Curve di livello', 'Avvicinamento');
    pause(0.1); % Pausa per visualizzare il plot ad ogni iterazione
end
