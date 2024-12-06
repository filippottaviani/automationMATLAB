[q1, q2] = meshgrid(-pi:.1:pi, -pi:.1:pi);
f1 = cos(q1) + cos(q1 + q2);
f2 = sin(q1) + sin(q1 + q2);
e1 = 1 - f1;
e2 = 1 - f2;
L1 = 1;
L2 = 1;
n_e = e1.^2 + e2.^2;
figure(2)
contour(q1, q2, n_e, 50)
grid on;
hold on;
axis([-pi pi -pi pi]);
for i=1:40
[q10, q20] = ginput(1);
j=1;
q= [q10,q20];
while(j <= 300)
    q1=q(j,1);
    q2=q(j,2);
    J = [-L1*sin(q(j,:))-L2*sin(q(j,:)+q(j+1,:)), -L2*sin(q(j,:)+q(j+1,:)); L1*cos(q(j,:))+L2*cos(q(j,:)+q(j+1,:)), L2*cos(q(j,:)+q(j+1,:))]; % Jacobiano del robot RR planare
    f = [L1*cos(q(j,:))+L2*cos(q(j,:)+q(j+1,:)); L1*sin(q(j,:))+L2*sin(q(j,:)+q(j+1,:))];
    q(j+1,:) = q(j,:)+inv(J)*(r-f);
    j=j+1;
end
plot(q(:,1),q(:,2),'-x');
end