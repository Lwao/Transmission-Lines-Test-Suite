function [al_c, al_d] = aten(z, w, con, f, ef, er)
    mi = 1;
    del = 1/(sqrt(pi*f*con*mi));
    %atenua��o condutor
    R = 1/(con*del);
    al_c = R/(z*w); 
    %atenua��o diel�trico
    t = tan(del);
    al_d = (2*pi*f)/(3e8)*((er*(ef-1))/(2*sqrt(ef)*(er-1)))*t; 