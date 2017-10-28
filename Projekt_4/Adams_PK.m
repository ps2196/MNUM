function[w, iter] = Adams_PK(T0, Tk, x01, x02, STEP)
h = STEP; %krok
x1=x01; %warunki poczatkowe
x2=x02;
    
t=T0:h:Tk; %ile krokow
w(:,1) = [x1 x2]; %dane do wykresu

iter = 1;

%wyznaczenie wartosci satartowych za pomocametody RK4 
for i=1:3
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


for i = 4:(length(t))
tmp1 = x1 + (h/24)*55*dx1(x1,x2) - 59*(h/24)*dx1(w(1,i-1),w(2,i-1)) + 37*(h/24)*dx1(w(1,i-2),w(2,i-2)) - 9*(h/24)*dx1(w(1,i-3),w(2,i-3));
tmp2 = x2 + (h/24)*55*dx2(x1,x2) - 59*(h/24)*dx2(w(1,i-1),w(2,i-1)) + 37*(h/24)*dx2(w(1,i-2),w(2,i-2)) - 9*(h/24)*dx2(w(1,i-3),w(2,i-3));

x1 = x1 + (h/720)*646*dx1(x1,x2) - 264*(h/720)*dx1(w(1,i-1),w(2,i-1)) + 106*(h/720)*dx1(w(1,i-2),w(2,i-2)) - 19*(h/720)*dx1(w(1,i-3),w(2,i-3)) + h*(251/720)*dx1(tmp1, tmp2);
x2 = x2 + (h/720)*646*dx2(x1,x2) - 264*(h/720)*dx2(w(1,i-1),w(2,i-1)) + 106*(h/720)*dx2(w(1,i-2),w(2,i-2)) - 19*(h/720)*dx2(w(1,i-3),w(2,i-3)) + h*(251/720)*dx2(tmp1, tmp2);

w(:,i)=[x1 x2];

iter = iter + 1;

end

%plot(w(1,:),w(2,:));
disp('Liczba iteracji = ')
disp(iter);
end