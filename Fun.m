function F = Fun(x,r,m,d)
    x1 = x(1);
    x2 = x(2);
    F(1) = (x1-m)^2 + x2^2 - r^2;
    F(2) = (cos(4*pi*d)*(x1-0.5) + sin(4*pi*d)*x2)^2 ...
           + (sin(4*pi*d)*(x1-0.5) - cos(4*pi*d)*x2)^2 - (0.5)^2;
end

