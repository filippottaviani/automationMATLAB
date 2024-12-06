function [theta,r] = AsseAngoloInverso(R)

% Ricavo sin e cos theta
s=(sqrt(((R(1,2)-R(2,1))^2)+((R(1,3)-R(3,1))^2)+(R(2,3)-R(3,2))^2))/2;
c=(R(1,1)+R(2,2)+R(3,3)-1)/2;

% Ricavo theta
theta=atan2(s,c);

% Controllo singolarità
if (mod(theta,2*pi) == 0)
    r=[0 0 0];
elseif(mod(theta,pi) == 0)
    r= [sqrt((R(1,1)+1)/2);sqrt((R(2,2)+1)/2);sqrt((R(3,3)+1)/2)];
else
   
% Ricavo l'asse r
r=[(1/(2*s))*(R(3,2)-R(2,3));(1/(2*s))*(R(1,3)-R(3,1));(1/(2*s))*(R(2,1)-R(1,2))];
end

% Per leggere due output occorre usare il comando: [r,theta] = AsseAngoloInverso(R)
end