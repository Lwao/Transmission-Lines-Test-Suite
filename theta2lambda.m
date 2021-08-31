function lam = theta2lambda(z)
    g = z2gamma(z);
    if real(g)<0
        theta = pi-atan((imag(g))/(real(g)));
        lam = 0.5-0.25*(1-(theta/pi));
        if lam >=0.5 
            lam = mod(lam, 0.5); 
        end 
    else
        theta = atan((imag(g))/(real(g)));
        lam = 0.25*(1-(theta/pi));
        if lam >=0.5 
            lam = mod(lam, 0.5); 
        end
    end
end