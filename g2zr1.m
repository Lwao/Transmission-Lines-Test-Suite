function [z1, z2] = g2zr1(z)
    g = z2gamma(z);
    aaa = abs(g)^2
    a = 1-aaa;
    b = 4-8*aaa;
    c = -16*aaa;
    u1 = (-b+sqrt(b^2-4*a*c))/(2*a);
    %u2 = (-b-sqrt(b^2-4*a*c))/(2*a);
    x1 = sqrt(u1);
    %x2 = sqrt(u2);
    z1 = 1+x1*i; 
    z2 = 1-x1*i;
end