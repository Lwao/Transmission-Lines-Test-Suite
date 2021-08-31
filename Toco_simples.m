function [Yl1,Yl2,d1,d2,l1,l2] = Toco_simples( Zlinha, Zcarga, modo)
    Znorm = Zcarga/Zlinha;
    Z0 = Zlinha;
    Y0 = 1/Z0;
    smith = figure(1);
    Xl = imag(Zcarga);
    Rl = real(Zcarga);
    gerar_st();
    [Yl1,Yl2,d1,d2,l1,l2] = single_stub(Znorm,modo);
end

