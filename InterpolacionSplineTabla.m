%https://la.mathworks.com/help/matlab/ref/spline.html
%https://la.mathworks.com/help/matlab/ref/unmkpp.html
%https://la.mathworks.com/help/matlab/ref/mkpp.html
%{
hold on
x = 1:0.2:1.6
y = [2.71 3.32 4.05 4.95]
plot(x, y,'o')
xn=[1:0.01:1.6]
plot(xn, exp(xn))
InterpolacionSplineTabla(x, y)
hold off
%}
function InterpolacionSplineTabla(x, y)
    pp=spline(x,y); %piecewise polynomial
    [breaks,coefs,L,order,dim]=unmkpp(pp)
    %pp=mkpp(breaks,coefs);
    s=size(x);
    xh=x(1):0.01:x(s(2)); %vec x para grafico
    plot(xh,ppval(pp,xh))
    for i=2:s(2)
        line([x(i) x(i)],ylim,'LineStyle','--','Color','k')
    end
end