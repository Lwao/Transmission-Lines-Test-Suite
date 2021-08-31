function s = z2s(z)
    g = z2gamma(z);
    s = (1+abs(g))./(1-abs(g));
end
