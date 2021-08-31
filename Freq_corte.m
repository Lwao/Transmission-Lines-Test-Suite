function FC = Freq_corte(a,b,m,n,er)

aux = (m/a)^2 + (n/b)^2;
FC = 3e8/(2*sqrt(er))*sqrt(aux);

end

