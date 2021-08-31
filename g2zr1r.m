function [B11,B12,Bst1,Bst2,L1,L2,Ls1,Ls2] = g2zr1r(YL,d)

gl = real(YL);
bl=imag(YL);

t = tan(2*pi*d);

aux = (1+t^2)*gl - (gl*t)^2;
B11= -bl + (1 +sqrt(aux))/t
B12= -bl + (1 -sqrt(aux))/t

aux1 = (1+t^2)*gl - (gl*t)^2;
Bst1= (sqrt(aux1)+gl)/(gl*t)
Bst2= (-sqrt(aux1)+gl)/(gl*t)

L11 = atan(1/B11)*(-1/(2*pi));
L22 = atan(1/B12)*(-1/(2*pi));
if L11 < 0
    L1 = L11 + 0.5
else
    L1 = L11
end
if L22 < 0
    L2 = L22 + 0.5
else
    L2 = L22
end

Ls11 = atan(1/Bst1)*(-1/(2*pi));
Ls22 = atan(1/Bst2)*(-1/(2*pi));
if Ls11 < 0
    Ls1 = Ls11 + 0.5
else
    Ls1 = Ls11
end
if Ls22 < 0
    Ls2 = Ls22 + 0.5
else
    Ls2 = Ls22
end


end

