function lam = loc_lam_tg(z)
    g = z2gamma(z);
    ang = atan((imag(g))/(real(g)));
    if abs(imag(z))>=1 
        lam = (-0.125*ang/1.570796326797)+0.25; 
    end
    if ((imag(z)<1)&(imag(z)>=0)) 
        lam = (-0.125*ang/1.570796326797); 
    end
    if ((imag(z)<0)&(imag(z)>-1)) 
        lam = (-0.125*ang/1.570796326797)+0.5; 
    end
    if z==0
        lam = 0.5;
    end
end

