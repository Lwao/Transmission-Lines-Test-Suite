function Z = Z0( R,L,G,C,w )
    aux = (R+i*w*L)/(G + i*w*C);
    Z = sqrt(aux);


end

