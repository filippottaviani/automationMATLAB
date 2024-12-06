function [S] = veeOperator(vect)

vx = vect(1);
vy = vect(2);
vz = vect(3);

S = [0 -vz vy;vz 0 -vx;-vy vx 0]; 
end