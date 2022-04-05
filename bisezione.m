function [val, it] = bisezione(f, a, b, tol)
    if sign(f(a))*sign(f(b)) >= 0
        error("Intervallo non valido");
    end
    k = 1;
    maxit = ceil(log2((b-a)/tol)-1);
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
        it = k;
end