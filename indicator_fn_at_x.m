function fn = indicator_fn_at_x(x)
% +1 for divergence (outside), -1 for no divergence (inside)
    fn = @(y) (fractal(x + 1i*y) < 100)*2 - 1;
end
