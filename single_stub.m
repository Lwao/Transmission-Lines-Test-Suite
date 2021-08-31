function [yl1, yl2, d1,d2,l1,l2] = single_stub(z,modo)
    setZ(z, 'tg', 'zl');
    y = 1/z;
    setZ(y, 'tg', 'yl');
    [y1, y2] = g2zr1(y);
    setZ(y1, 'tg', 'y1');
    d1 = theta2lambda(y1) - theta2lambda(y);
    setZ(y2, 'tg', 'y2');
    d2 = theta2lambda(y2) - theta2lambda(y);
    yl1 = 1 - y1;
    yl2 = 1 - y2;
    setZ(yl1, 'tg', 'yl1');
    setZ(yl2, 'tg', 'yl2');
    
    switch modo
    case 'curto'
        l1 = theta2lambda(yl1) - 0.25;
        l2 = theta2lambda(yl2) + 0.25;
       
    case 'aberto'
        l1 = theta2lambda(yl1);
        l2 = theta2lambda(yl2);
    end
    
end