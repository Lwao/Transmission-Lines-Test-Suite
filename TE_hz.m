function TE_hz(m, n, a, b)
kx = m*pi/a;
ky = n*pi/b;

%Gráfico de contorno
for i = 1:a
    x(i) = (i/40)*a;
    for j = 1:b
        y(j) = (j/20)*b;
        Hz(j, i) = cos(kx*x(i)).*cos(ky*y(j));
    end
end

%Gráfico convencional em y=b/2
%yc = b/2;
%xc = 1:a;
%Ezc = 20*cos(kx*xc).*cos(ky*yc);

%Gráfico de superfície
[X, Y] = meshgrid(0:a, 0:b);
Hzs = 20*cos(kx.*X).*cos(ky.*Y);

%subplot(3, 1, 1)
figure(1)
contour(x, y, Hz, 4)
title('TE Hz (Contorno)')
ylabel('y')
xlabel('x')
axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 2)
%figure(2);
%plot(xc, Hzc)
%title('TE Hz (Convencional)')
%xlabel('20*Hz, (em y=b/2)')
%ylabel('x')
%axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 3)
figure(3);
surf(Hzs)
%axis([0 a 0 b 0 b/2])
axis('equal')
title('TE Hz (Superfície)')
xlabel('x')
ylabel('y')
zlabel('20*Hzs')
end
