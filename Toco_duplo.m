function [B11,B12,B21,B22,l1,l2,ls1,ls2] = Toco_duplo(Z0,ZL,d)

    z = ZL/Z0;
    Y0 = 1 /Z0;
    Yl= 1/ZL;
    y = 1/z;
    re = real(y);
    im = imag(y);
    raio = 1/(1+re);
    centro = re*raio;
    
    ang = 4*pi*d;
    smith = figure(1);
    theta = linspace(-pi, pi, 180);
    a = (1/2)*cos(theta) + 0.5;
    b = (1/2)*sin(theta);
    xrot = cos(ang).*a -sin(ang).*b;
    yrot = sin(ang).*a + cos(ang).*b;
    
    plot(xrot,yrot, 'r','LineWidth', 1.5);
    hold on;
    rv = raio*cos(theta) + centro;
    smv = raio*sin(theta);
    plot(rv,smv,'m', 'LineWidth',1.5);
    gerar_st();
   
    setZ(z, 'tg', 'zl');
   
    setZ(y, 'tg', 'yl');
 
    
    [B11,B12,B21,B22,l1,l2,ls1,ls2] = g2zr1r(y,d);
    ys11= i*B11;
    SetZsy(ys11,'tg','Yst11');
    ys12= i*B12;
    SetZsy(ys12,'tg','Yst12');
    ys21= i*B21;
    SetZsy(ys21,'tg','Yst21');
    ys22= i*B22;
    SetZsy(ys22,'tg','Yst22');
   
    Ya1 = y + ys12;
    SetZsy(Ya1, 'tg', 'Ya1');
    Ya2 =  y + ys11;
    SetZsy(Ya2, 'tg', 'Ya2');
   % yl2 = 1 - y2;
   % setZ(yl1, 'tg', 'yl1');
   % setZ(yl2, 'tg', 'yl2');
    

end


