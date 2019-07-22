%{
x_i=0.5:0.25:2.5
f_eva = [3.2974 2.8227 2.7183 2.7923 2.9878 3.2883 3.6945 4.2168 4.8730]
[f_diff, f_diff2]=DiferenciasDivididasTabla(x_i, f_eva)
%}
function [f_diff, f_diff2]=DiferenciasDivididasTabla(x_i, f_eva)
    s=size(x_i);
    f_diff=zeros(1,s(1,2));
    f_diff2=zeros(1,s(1,2));
    h=x_i(2)-x_i(1);
    f_diff(1)=(f_eva(2)-f_eva(1))/h;
    f_diff2(1)=(f_eva(3)-2*f_eva(2)+f_eva(1))/h.^2;
    for i=2:s(1,2)-1 %2..Cant. de col. de x_i - 1
        f_diff(i)=(f_eva(i+1)-f_eva(i-1))/(2*h);
        f_diff2(i)=(f_eva(i-1)-2*f_eva(i)+f_eva(i+1))/h.^2;
    end
    f_diff(s(1,2))=(f_eva(s(1,2))-f_eva(s(1,2)-1))/h;
    f_diff2(s(1,2))=(f_eva(s(1,2))-2*f_eva(s(1,2)-1)+f_eva(s(1,2)-2))/h.^2;
end