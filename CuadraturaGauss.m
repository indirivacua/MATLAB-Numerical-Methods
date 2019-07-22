%CuadraturaGauss(@(x) (exp(x)).*sin(x)./(1+x^2),0,3,2)
function I = CuadraturaGauss(f,a,b,n)
    %Def. Pesos y Puntos
    pesos=zeros(1,n); %w's
    puntos=zeros(1,n); %t's
    switch n
        case 2
            pesos(1)=1;
            pesos(2)=1;
            puntos(1)=sqrt(1/3);
            puntos(2)=-sqrt(1/3);
        case 3
            pesos(1)=8/9;
            pesos(2)=5/9;
            pesos(3)=5/9;
            puntos(1)=0;
            puntos(2)=sqrt(3/5);
            puntos(3)=-sqrt(3/5);
        case 4
            pesos(1)=(18+sqrt(30))/36;
            pesos(2)=(18+sqrt(30))/36;
            pesos(3)=(18-sqrt(30))/36;
            pesos(4)=(18-sqrt(30))/36;
            puntos(1)=sqrt((3-2*sqrt(6/5))/7);
            puntos(2)=-sqrt((3-2*sqrt(6/5))/7);
            puntos(3)=sqrt((3+2*sqrt(6/5))/7);
            puntos(4)=-sqrt((3+2*sqrt(6/5))/7);
        case 5
            pesos(1)=128/255;
            pesos(2)=(322+13*sqrt(70))/900;
            pesos(3)=(322+13*sqrt(70))/900;
            pesos(4)=(322-13*sqrt(70))/900;
            pesos(5)=(322-13*sqrt(70))/900;
            puntos(1)=0;
            puntos(2)=(1/3)*sqrt(5-2*sqrt(10/7));
            puntos(3)=-(1/3)*sqrt(5-2*sqrt(10/7));
            puntos(4)=(1/3)*sqrt(5+2*sqrt(10/7));
            puntos(5)=-(1/3)*sqrt(5+2*sqrt(10/7));
        otherwise
            fprintf('No puede hacer nada con tu entrada\n')
            return
    end
    %{
syms x t
if (a ~= -1) && (b ~= 1)
        f=subs(f, x, ((b-a)*t)/2+(b-a)/2)
end
pesos(1,:)
puntos(1,:)
    %}
    I=0.0;
    for i=1:n
        t=((b-a)*puntos(1,i))/2+(b-a)/2;
        I=I+pesos(1,i)*f(t);
    end
    I = I * ((b-a)/2);
end