function [val] = bisezione(f, a, b)
    k = 1;
    maxit = 100;
    tol = 0;
    x = inf;
    while k <= maxit && abs(b-a) > tol
        x = a + (b-a)/2;
        if f(x) == 0
            val = x;
            break;
        else if f(x)*f(a) > 0
                a = x;
        else if f(x)*f(b) > 0
                b = x;
            end
        end
        end
        k = k+1;
    end
        val = x;
end