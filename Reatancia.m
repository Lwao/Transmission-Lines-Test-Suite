function [cap1, cap2,d1c,d2c] = Reatancia( Zcarga,Zlinha )
    modo = 'curto';
    Znorm = Zcarga/Zlinha;
    smith = figure(1);
    gerar_st();
    y = 1/Znorm;
    
    setZ(Znorm, 'tg', 'zl');
    
    [y1, y2] = g2zr1(y);
    setZ(y1, 'tg', 'y1');
    d1c = theta2lambda(y1) - theta2lambda(Znorm);
    setZ(y2, 'tg', 'y2');
    d2c = theta2lambda(y2) - theta2lambda(Znorm);
    yl1 = 1 - y1;
    yl2 = 1 - y2;
    setZ(yl1, 'tg', 'yl1');
    setZ(yl2, 'tg', 'yl2');
    

    
    cap1 = yl1*Zlinha;
    cap2 = yl2*Zlinha;


end

