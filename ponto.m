function ponto(z, id)
    g = z2gamma(z);
    plot(real(g), imag(g), 'og');
    xpos = real(g);
    ypos = imag(g);
    h = text(xpos, ypos,id,'Color','Red','FontWeight','bold');
    h.FontSize = 12;
    set (h, 'VerticalAlignment', 'bottom');
end