function m = bisection(fn_f, s, e)
% finds the point where fn_f switches sign;
% stop when |e-s|<1e-4
    while abs(e - s) > 1e-4
        m = (s + e)/2;
        if fn_f(m) > 0      % outside,+1
            e = m;
        else                % inside,-1
            s = m;
        end
    end
    m = (s + e)/2;
end
