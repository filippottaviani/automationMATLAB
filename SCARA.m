syms a alpha th d;
syms d4 th1 th2 th4;

a1 = 8;
a2 = 10;
a3 = 11;
a4 = 6;
th1 = 0;
th2 = 0;
th4 = 0;
d4 = 0;

%L=Link([th d a alpha]);

Lx(1)=Link([th1 a2 a1 0 0]);
Lx(2)=Link([th2 0 a3 pi 0]);
Lx(3)=Link([0 d4 0 0 1]);
Lx(4)=Link([th4 a4 0 0 0]);

RobIUGX=SerialLink(Lx);

RobIUGX.plot([0 0 20 0],'workspace', [-50 50 -50 50 -50 50]);

RobIUGX.name='grinch';
for th1=0:0.1:pi/3
    RobIUGX.plot([th1 0 0 0],'workspace', [-50 50 -50 50 -50 50]);
    drawnow;
end

for th2=0:0.1:0.5*pi
    RobIUGX.plot([th1 th2 0 0],'workspace', [-50 50 -50 50 -50 50]);
    drawnow;
end
    for d4_=0:1:15
    RobIUGX.plot([th1 th2 d4 0],'workspace', [-50 50 -50 50 -50 50]); 
    drawnow;
    end  
for th4=0:0.1:0.8*pi
    RobIUGX.plot([th1 th2 d4 th4],'workspace', [-50 50 -50 50 -50 50]); 
    drawnow;
end


