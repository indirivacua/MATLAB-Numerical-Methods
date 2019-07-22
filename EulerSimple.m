%[xt, yt] = EulerSimple(inline('x+y','x','y'),0,0,1,0.25)
%{
hold on
g=inline('x+exp(-x)','x') %Solucion
x=0:0.1:1
plot(x,g(x))
[xt, yt] = EulerSimple(inline('-y+x+1','x','y'),1,0,1,0.05)
plot(xt,yt)
plot(xt,yt, 'o')
hold off
%}
function [x,y]=EulerSimple(f, y0, a, b, h)
  N=(b-a)/h;
  x=a:h:b; %[0, 0.25, ..., 1]
  y=zeros(1, N); %Matriz 1 fila y N columnas
  y(1)=y0; %C.I : y(0)=0
  for i=1:N
    y(i+1)=y(i)+h*f(x(i),y(i));
  end
end