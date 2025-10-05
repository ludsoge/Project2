% choose the same x-range used for fitting (stay inside)
p = 15;
s = -2.0;   % left bound on x  (fitting xmin)
e =  0.3;   % right bound on x (fitting xmax)
L = poly_len(p, s, e);
fprintf('Approximate curve length on [%g, %g] is: %.6f\n', s, e, L);
