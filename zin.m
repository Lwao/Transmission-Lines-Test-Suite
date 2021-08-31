function zzz = zin(z, comp)
    loca = theta2lambda(z);
    tam = (loca + comp);
    if tam >=0.5 
        tam = mod(tam, 0.5); 
    end 
    theta = lambda2theta(tam);
    g = z2gamma(z);
    new_g = abs(g)*exp(theta*i);
    zzz = gamma2z(new_g);
    setZ(zzz, 'tg', 'zin'); 
end
