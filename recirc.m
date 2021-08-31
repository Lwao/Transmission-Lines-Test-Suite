function recirc(r)
    phi = 1:1:360;
    theta = phi*pi/180;
    a = 1/(1+r);
    m = r/(r+1); 
    n = 0;
    Re = a*cos(theta)+m;
    Im = a*sin(theta)+n;
    z = Re + Im*i;
    plot(real(z), imag(z), 'k');
end