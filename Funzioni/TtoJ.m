function jacobian = TtoJ(T)

% Controlla che la matrice di trasformazione sia omogenea
if size(T, 3) ~= 1
  error('La matrice di trasformazione deve essere omogenea.')
end

% Calcola la derivata parziale della matrice di trasformazione rispetto alle variabili di giunto
jacobian = T.' * diff(T, 'q');

end