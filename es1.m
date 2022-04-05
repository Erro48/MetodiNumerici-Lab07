clc
clear all

bisezione(@f2, 5/6, 25/6)



function val = f2(x)
    val = x-1;
end

function val = f1(x)
    val = x - (1/3)*sqrt(20*x-25);
end