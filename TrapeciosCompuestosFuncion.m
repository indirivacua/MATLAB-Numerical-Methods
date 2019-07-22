%TrapeciosCompuestosFuncion(inline('x.^(1/2)','x'), 1, 1.3, 0.05)
function TrapeciosCompuestosFuncion(f, a, b, h)
    x=a:h:b;
    I=0.0;
    s=size(x);
    for k=2:s(1,2)-1
        I=I+2*f(x(k));
    end
    I=(h/2)*(f(x(1))+I+f(x(end)));
    fprintf('I=%f\n', I);
end
