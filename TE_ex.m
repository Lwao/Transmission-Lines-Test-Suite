function TE_ex(m, n, a, b)
kx = m*pi/a;
ky = n*pi/b;

%Gráfico de contorno
for i = 1:a
    x(i) = (i/40)*a;
    for j = 1:b
        y(j) = (j/20)*b;
        Ex(j, i) = cos(kx*x(i))*sin(ky*y(j));
    end
end

%Gráfico de superfície
[X, Y] = meshgrid(0:a, 0:b);
Exs = i*cos(kx.*X).*sin(ky.*Y);

%subplot(3, 1, 1)
figure(1)
contour(x, y, Ex, 4)
title('TE Ex (Contorno)')
ylabel('y')
xlabel('x')
axis('equal')
%axis([0 a 0 b])

%subplot(3, 1, 3)
figure(3);
surf(Exs)
%axis([0 a 0 b 0 b/2])
axis('equal')
title('TE Ex (Superfície)')
xlabel('x')
ylabel('y')
zlabel('20*Exs')
end
