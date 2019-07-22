%Simpsons1_3CompuestoFuncion(inline('1/(1+x.^2)','x'), 0, 1, 0.1)
function Simpsons1_3CompuestoFuncion(f, a, b, h)
    x=a:h:b;
    s=size(x);
    I=0.0;
    for i=1:2:s(1,2)-2
        I = I + Simpsons1_3SimpleFuncion(f,x(i),x(i+2));
    end
    fprintf('I=%f\n', I);
end