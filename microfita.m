% Parâmetros de dimensão
%   w = comprimento do condutor de fita (m)
%   h = espessura do substrato (m)
%   e = permissividade do substrato
%   f = frequência de operação (Hz)
%
% Parâmetros de linha
%   z = impedância (ohm)
%   comp = comprimento de onda (m)
%   ef = permissividade efetiva
%   wlh = razão w/h
%
% Parâmetros de atenuação
%   al_c = atenuação devido à condutividade (Np/m)
%   al_d =atenuação devido à perda no dielétrico (Np/m))


%SEM DIMENSÕES
function [wlh] = imp2dim(z, er, r)
    A = z/60 * sqrt((er-1)/2) + ((er-1)/(er+1))*(0.23+0.11/er);
    B = 60*pi*pi/(z*sqrt(er));
    if (r<=2) 
        wlh = (8*exp(A))/(exp(2*A)-2); 
    end
    if (r>2) 
        wlh = 2/pi * (B-1-log(2*B-1)+((er-1)/(2*er))*(log(B-1)+0.39-0.61/er)); 
    end
end

%COM DIMENSÕES
function [z] = dim2imp(w, h, ef)
    wlh = w/h;
    if (wlh<=1) 
        z = ln((8/wlh)+(wlh/4))*60/sqrt(ef); 
    end
    if (wlh>1) 
        z = 120*pi/sqrt(ef) * 1/(wlh +1.393+0.667*ln(wlh+1.444)); 
    end
end

%function [u] = vel(ef)
%    u = 3e8/sqrt(ef);
%end

