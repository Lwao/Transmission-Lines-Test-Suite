function gerar_st()
    theta = linspace(-pi, pi, 180);
    a = 1;
    m = 0; 
    n = 0;
    Re = a*cos(theta)+m;
    Im = a*sin(theta)+n;
    z = Re + Im*i;
    plot(real(z), imag(z), 'k')
    
    axis('equal')
    axis('off')
    hold on
    
    plot([-1 1], [0 0], 'k');
    
    
    r_vl = [0.5 1 2 4];
    x_vl = [0.2 0.5 1 2];
    
    for it = 1:1:length(r_vl)
        recirc(r_vl(it));
        xpos = z2gamma(r_vl(it));
        h = text(xpos, 0, num2str(r_vl(it)));
        set(h, 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
    end
    
    for it = 1:1:length(x_vl)
        imcirc(x_vl(it));
        imcirc(-x_vl(it));
        xpos = real(z2gamma(x_vl(it)*i));
        ypos = imag(z2gamma(x_vl(it)*i));
        h = text([xpos xpos], [ypos -ypos], ['j' num2str(x_vl(it)); 'j' num2str(x_vl(it))]);
        set (h(1), 'VerticalAlignment', 'bottom','Rotation',-5,'Color','b');
        set (h(2), 'VerticalAlignment', 'top','Rotation',-5,'Color','b');
        if xpos==0
            set (h, 'HorizontalAlignment', 'center','Color','b');
        elseif xpos<0
            set (h, 'HorizontalAlignment', 'right','Rotation',-5,'Color','b');
        end
    end
    
    h = text(-1, 0, '0');
    set(h, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'right');
end

