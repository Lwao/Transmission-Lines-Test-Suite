function imcirc(x)
    a = abs(1/x);
    m = 1;
    n = 1/x;
    k =1;
    for t = 1:1:360
        angle(t) = t*pi/180;
        Re(t)=a*cos(angle(t))+m; 
        Im(t)=a*sin(angle(t))+n;
        z(t) = Re(t)+Im(t)*i;
        if abs(z(t))<=1 
            zz(k) = z(t);
            k = k+1;
        end
    end
    plot(real(zz), imag(zz), 'k:');   
end