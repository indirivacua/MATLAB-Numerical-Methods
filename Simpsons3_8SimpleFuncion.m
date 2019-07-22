%Simpsons3_8SimpleFuncion(inline('1/(1+x.^2)','x'), 0, 0.2)
function I = Simpsons3_8SimpleFuncion(f, a, b)
    h=(b-a)/3;
    x=a:h:b;
    I=(3*h/8)*(f(x(1))+3*f(x(2))+3*f(x(3))+f(x(4)));
end
