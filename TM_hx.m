function TM_hx(m, n, a, b)
kx = m*pi/a;
ky = n*pi/b;

%Gráfico de contorno
for i = 1:a
    x(i) = (i/40)*a;
    for j = 1:b
        y(j) = (j/20)*b;
        Hx(j, i) = -sin(kx*x(i)).*cos(ky*y(j));
    end
end

%Gráfico de superfície
[X, Y] = meshgrid(0:a, 0:b);
Hxs = i*sin(kx.*X).*cos(ky.*Y);

%subplot(3, 1, 1)
figure(1)
contour(x, y, Hx, 4)
title('TM Hx (Contorno)')
ylabel('y')
xlabel('x')
axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 3)
figure(3);
surf(Hxs)
%axis([0 a 0 b 0 b/2])
axis('equal')
title('TM Hx (Superfície)')
xlabel('x')
ylabel('y')
zlabel('20*Hxs')
end
