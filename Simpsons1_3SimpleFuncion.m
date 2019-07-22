%Simpsons1_3SimpleFuncion(inline('1/(1+x.^2)','x'), 0, 0.2)
function I = Simpsons1_3SimpleFuncion(f, a, b)
    h=(b-a)/2;
    x=a:h:b;
    I=(h/3)*(f(x(1))+4*f(x(2))+f(x(3)));
end
