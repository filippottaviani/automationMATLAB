function [R] = AsseAngoloDiretto(theta,r)
    % Vettore dell'asse di rotazione
    axis = r'; % Asse di rotazione normalizzato
    
    % Matrice di rotazione
    R = r*r'+(eye(3)-r*r')*cos(theta)+veeOperator(r)*sin(theta);
end