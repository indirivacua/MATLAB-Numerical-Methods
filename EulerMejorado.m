%[xt, yt] = EulerMejorado(0,1,0.25,0,inline('x+y','x','y'))
function [x, y]=EulerMejorado(f, y0, a, b, h)
  N=(b-a)/h;
  x=a:h:b; %[0, 0.25, ..., 1]
  y=zeros(1, N); %Matriz 1 fila y N columnas
  y(1)=y0; %y(0)=0
  for i=1:N
    y_es=y(i)+h*f(x(i),y(i));
    y(i+1)=y(i)+(h/2)*(f(x(i),y(i))+f(x(i+1),y_es));
  end
end