function [w, iter] = RK4_SK(T0, Tk, x01, x02, STEP)

h = STEP;%krok
%warunki poczatkowe
x1 = x01;
x2 = x02;

t = T0:h:Tk; %liczba krokow

w(:,1) = [x1,x2]; %wykres

iter = 1;

for i=1:(length(t)-1)
    k11 = dx1(x1,x2);
    k12 = dx2(x1,x2);
    
    k21 = dx1(x1 + 0.5*h , x2 + 0.5*h*k11);
    k22 = dx2(x1 + 0.5*h , x2 + 0.5*h*k12);
    
    k31 = dx1(x1 + 0.5*h , x2 + 0.5*h*k21);
    k32 = dx2(x1 + 0.5*h , x2 + 0.5*h*k22);
    
    k41 = dx1(x1 + h , x2 + h*k31);
    k42 = dx2(x1 + h , x2 + h*k32);
    
    x1 = x1 + (1/6)*h*(k11 + 2*k21 + 2*k31 + k41);
    x2 = x2 + (1/6)*h*(k12 + 2*k22 + 2*k32 + k42);
    
    w(: , i+1) = [x1,x2];
    iter = iter + 1;
end

%plot(w(1,:) , w(2,:)); %rysuje wykres
disp('Liczba iteracji = ')
disp(iter);
end