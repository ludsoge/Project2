clear; clc;

c = 0.3 + 0.6i;

fprintf('For c = %.2f + %.2fi, iterations = %d\n', real(c), imag(c), fractal(c));
