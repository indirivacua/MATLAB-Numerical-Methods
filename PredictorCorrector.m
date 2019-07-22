%PredictorCorrector(inline('1+2*x*y','x','y'),0,1,0.1,3,2,0.001)
function PredictorCorrector(f,a,b,h,y0,n,cota)
    [xn, yn] = EulerMejorado(f, y0, a, b, h);
    y_ant=yn(n)+h*(f(xn(n),yn(n))); 
    y_act=0.0;
    while (abs(y_ant-y_act) > cota)
        y_ant=y_act;
        y_act=yn(n)+(h/2)*(f(xn(n),yn(n))+f(xn(n+1),y_ant));
    end
    fprintf('y_{%d}=%f\n',n,y_act)
end