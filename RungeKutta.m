%[xt, yt] = RungeKutta(0,1,0.25,0,inline('x+y','x','y'))
function [x, y]=RungeKutta(a, b, h, y0, f)
  N=(b-a)/h;
  x=a:h:b; %[0, 0.25, ..., 1]
  y=zeros(1, N); %Matriz 1 fila y N columnas
  y(1)=y0; %y(0)=0
  for i=1:N
    k1=h*f(x(i),y(i));
    k2=h*f(x(i+1),y(i)+k1);
    y(i+1)=y(i)+k1/2+k2/2;
  end
end