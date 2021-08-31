function [wlh, ef, comp, z] = dim2par(w, h, er, f)
    %eps efetivo
    wlh = w/h;
    ef = (er+1)/2 + (er-1)/(2*sqrt(1+12/wlh));
    %comp onda
    u = 3e8/sqrt(ef);
    comp = u/f;
    %impedância
    if (wlh<=1) 
        z = log((8/wlh)+(wlh/4))*60/sqrt(ef); 
    else 
        z = 120*pi/(sqrt(ef)*(wlh +1.393+0.667*log(wlh+1.444))); 
    end
end
