function [] = myPlot(ok, short, Ode)
%wyrysowuje rozwiazania uszyskane 
%dla krokow: za malego, za duzego oraz metody ode45
plot(ok(1,:), ok(2,:) , 'b', short(1,:), short(2,:), 'r',Ode(1,:),Ode(2,:),'g')
legend('step = 0.001', 'step = 0.01', 'ode45')
end