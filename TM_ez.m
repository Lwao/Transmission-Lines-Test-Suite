function TM_ez(m, n, a, b)
kx = m*pi/a;
ky = n*pi/b;

%Gráfico de contorno
for i = 1:a
    x(i) = (i/40)*a;
    for j = 1:b
        y(j) = (j/20)*b;
        Ez(j, i) = sin(kx*x(i)).*sin(ky*y(j));
    end
end

%Gráfico convencional em y=b/2
%yc = b/2;
%xc = 1:a;
%Ezc = 20*sin(kx*xc).*sin(ky*yc);

%Gráfico de superfície
[X, Y] = meshgrid(0:a, 0:b);
Ezs = 20*sin(kx.*X).*sin(ky.*Y);

%subplot(3, 1, 1)
figure(1)
contour(x, y, Ez, 4)
title('TM Ez (Contorno)')
ylabel('y')
xlabel('x')
axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 2)
%figure(2);
%plot(xc, Ezc)
%title('TM Ez (Convencional)')
%xlabel('20*Ez, (em y=b/2)')
%ylabel('x')
%axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 3)
figure(3);
surf(Ezs)
%axis([0 a 0 b 0 b/2])
axis('equal')
title('TM Ez (Superfície)')
xlabel('x')
ylabel('y')
zlabel('20*Ezs')
end
