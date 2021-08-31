function reta(z, loc)
    %format(6); %número de decimais
    g = z2gamma(z);
    ang = atan((imag(g))/(real(g)));
    if ((imag(g)<0)&(real(g)<0))|((imag(g)>0)&(real(g)<0))
        coss = -cos(ang);
        sinn = -sin(ang);
    else
        coss = cos(ang);
        sinn = sin(ang);
    end
    plot([0 coss], [0  sinn], '-.k'); %plot reta imp/ad
    xpos = coss;
    ypos = sinn;
    %tam_tl = loc_lam_tl(z);
    %tam_tg = loc_lam_tg(z);
    tam_tg = theta2lambda(z);
    tam_tl = -tam_tg+0.5;
    if tam_tl >=0.5 
        tam_tl = mod(tam_tl, 0.5); 
    end
    if loc == 'tl'  
        h = text(xpos, ypos, [num2str(tam_tl) '\lambda']);
        set (h, 'VerticalAlignment', 'top','FontWeight','bold');
    else
        h = text(xpos, ypos, [num2str(tam_tg) '\lambda']);
        set (h, 'VerticalAlignment', 'top','FontWeight','bold');
    end
end


