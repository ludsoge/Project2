function it = fractal(c)
    z = 0; it = 0;
    while abs(z) <= 2 && it < 100
        z = z*z + c;
        it = it + 1;
    end
end
