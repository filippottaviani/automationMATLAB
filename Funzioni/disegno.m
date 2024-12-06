% Disegno la base
base = rectangle('Position',[-1.5,-1.5,3,3],'FaceColor','none','EdgeColor','k','LineWidth',2);
hold on

DH = [0 -pi/3 5 pi/3 ; 0 pi/3 7 pi/3;0 0 pi/6 0];
joint_type = ['r' 'r' 'r'];

% Inizializzazione delle variabili
n = size(DH, 1);
T = eye(4);
joint = [0;0;0];


for i = 1:n
    theta = DH(i,4);
    d = DH(i,3);
    a = DH(i,1);
    alpha = DH(i,2);  
    
    % Matrice di trasformazione i-esima
    Ti = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
          sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
          0, sin(alpha), cos(alpha), d;
          0, 0, 0, 1];
      
    % Calcolo T ed estraggo z e p
    T = T * Ti;
    joint = [joint,T(1:3,3)]; % Terza colonna meno l'ultimo elemento
end

% Disegno dei giunti
for i = 1:n
    if joint_type(i) == 'r' % Giunto rotoidale
       draw_cylinder(joint(:,i))
    end

    if joint_type(i) == 'p' % Giunto prismatico 
        draw_cube(joint(:,i))
    end
end

for i = 2:n
    lStart = joint(:,i-1);
    lEnd = joint(:,i);
     draw_line(lStart,lEnd);
end

% Disegno giunto prismatico
function draw_cube(coord)
    xc = coord(1);
    yc = coord(2);
    zc = coord(3);
    L = 0.1;
    alpha = 0.8;
    vertices = [xc-L/2 yc-L/2 zc-L/2; xc+L/2 yc-L/2 zc-L/2; xc+L/2 yc+L/2 zc-L/2; xc-L/2 yc+L/2 zc-L/2; ...
                xc-L/2 yc-L/2 zc+L/2; xc+L/2 yc-L/2 zc+L/2; xc+L/2 yc+L/2 zc+L/2; xc-L/2 yc+L/2 zc+L/2];
    faces = [1 2 3 4; 5 6 7 8; 1 5 6 2; 4 8 7 3; 1 5 8 4; 3 7 6 2];
    patch('Vertices', vertices, 'Faces', faces, 'FaceColor','none','EdgeColor','k','LineWidth',2)
    hold on
end

% Disegno giunto rotoidale 
function draw_cylinder(coord)
    xc = coord(1);
    yc = coord(2);
    zc = coord(3);
    h = 0.3;
    alpha = 0.8;
    [X,Y,Z] = cylinder([0.1 0.1],20);
    Z = Z*h;
    a = surf(X+xc,Y+yc,Z+zc,'FaceColor','none','FaceAlpha',alpha,'EdgeColor','k','LineWidth',2);
    %rotate(a,[1 0 0],90,center);
    hold on
end

% Disegno braccio
function draw_line(inizioBr, fineBr)
    x1 = inizioBr(1);
    y1 = inizioBr(2);
    z1 = inizioBr(3);
    x2 = fineBr(1);
    y2 = fineBr(2);
    z2 = fineBr(3);
    line([x1 x2],[y1 y2],[z1 z2],'Color','k','LineWidth',2)
    hold on
end


