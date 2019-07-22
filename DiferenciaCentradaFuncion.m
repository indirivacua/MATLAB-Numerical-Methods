%DiferenciaCentradaFuncion(inline('sin(x)','x'),0.1,10,0.99500416527)
function DiferenciaCentradaFuncion(f, a, h, valorReal)
    for i=1:25
        fprintf('------------\n')
        fprintf('i: %d \n', i)
        f_eva=(f(a+h)-f(a-h))/(2*h);
        fprintf('d(f(%f))/dx = %f \n', a, f_eva)
        errorAbs = abs(valorReal-f_eva);
        fprintf('E = %f \n', errorAbs)
        h = h/10;
    end
end