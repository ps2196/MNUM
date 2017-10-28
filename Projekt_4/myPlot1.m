(function [] = myPlot1(rk, Ode)
%wyrysowuje rozwiazania uszyskane 
%dla krokow: za malego, za duzego oraz metody ode45
plot(rk(1,:), rk(2,:) , 'b', Ode(1,:),Ode(2,:),'g')
legend('RK4 ZK', 'ode45')
title('RK4 ze zmiennym krokiem dla x1(0) = 10, x2(0) = 0');
end