function TE_ey(m, n, a, b)
kx = m*pi/a;
ky = n*pi/b;
%k = 2*pi*f*sqrt(mi*ep);
%h = sqrt(kx^2+ky^2);
%u = 1/(sqrt(mi*ep));
%fc = u/2*sqrt((m/a)^2+(n/b)^2);
%beta = 2*pi*f/u *sqrt(1-(fc/f)^2);
%gamma = sqrt(kx^2+ky^2-k^2)


%Gráfico de contorno
for i = 1:a
    x(i) = (i/40)*a;
    for j = 1:b
        y(j) = (j/20)*b;
        Ey(j, i) = sin(kx*x(i))*cos(ky*y(j));
    end
end

%Gráfico convencional em y=b/2
%yc = b/2;
%xc = 1:a;
%Eyc = -i*sin(kx*xc).*cos(ky*yc);

%Gráfico de superfície
[X, Y] = meshgrid(0:a, 0:b);
Eys = -i*sin(kx.*X).*cos(ky.*Y);

%subplot(3, 1, 1)
figure(1)
contour(x, y, Ey, 4)
title('TE Ey (Contorno)')
ylabel('y')
xlabel('x')
axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 2)
%figure(2);
%plot(xc, Eyc)
%title('TM Ey (Convencional)')
%xlabel('20*Ey, (em y=b/2)')
%ylabel('x')
%axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 3)
figure(3);
surf(Eys)
%axis([0 a 0 b 0 b/2])
axis('equal')
title('TE Ey (Superfície)')
xlabel('x')
ylabel('y')
zlabel('20*Eys')
end
