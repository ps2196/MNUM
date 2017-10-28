function [Xt]= ODE(x01, x02)
%x01, x02 warunki poczatkowe

t0 = 0;     %poczatek przedzialu
dt = 0.001;  % krok
tk= 20;  % koniec przedzialu
x0 = [x01 x02];   % ��czymy warunki pocz�tkowe w jeden wektor%%
[T,X] = ode45('rrode',t0:dt:tk,x0); % wywo�anie funkcji ode45() 

plot(X(:,1),X(:,2), 'g') %wykress

end
