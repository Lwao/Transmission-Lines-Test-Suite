function gamKcirc(z)
    theta = linspace(-pi, pi, 180);
    g = z2gamma(z);
    a = abs(g)*cos(theta);
    b = abs(g)*sin(theta);
    plot(a, b, 'b')
end