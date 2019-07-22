%{
Parametros:
f: Funcion
p: Periodo p (f(x)=f(x+2p))
m: Numero de iteraciones (todas las sumas van de n=k a m)

Ejemplos: 
[coef_an, coef_bn]=SerieDeFourier(@(x) mod(x, 2).^2, 1, 3)
[coef_an, coef_bn]=SerieDeFourier(@(x) x.^2, 1, 10)
[coef_an, coef_bn]=SerieDeFourier(@(x) 0.5*square(2*pi*x), 1, 99)
%}
function [coef_an, coef_bn]=SerieDeFourier(f, p, m)
    c=@cos;
    s=@sin;
    for n=0:m
        %an & bn: Funciones que van dentro de la integral
        an_f = @(x) (1/p).*(f(x).*c((n*pi*x)/p));
        bn_f = @(x) (1/p).*(f(x).*s((n*pi*x)/p));
        %Coeficientes an & bn
        coef_an(n+1) = integral(an_f, -p, p);
        coef_bn(n+1) = integral(bn_f, -p, p);
    end
    %Terminos de la 'S'erie de Fourier
    S=@(x) coef_an(1)/2; %a0/2
    an_sum=@(x) 0; %sum(an*cos(n*pi*x/p) desde n=1 a m
    bn_sum=@(x) 0; %sum(bn*sin(n*pi*x/p) desde n=1 a m
    for n=1:m
        an_sum=@(x) (an_sum(x) + coef_an(n+1).*c((n*pi*x)/p));
        bn_sum=@(x) (bn_sum(x) + coef_bn(n+1).*s((n*pi*x)/p));
    end    
    S=@(x) (S(x) + an_sum(x) + bn_sum(x));
    hold on
    fplot(f,[-3 3])
    fplot(S,[-3 3])
    hold off
end