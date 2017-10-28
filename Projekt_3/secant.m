function[x,y] = secant(a, b)
%znajduje zera funkcji metoda siecznychstartujac w przedziale [a;b]

reps = 0;
tol = 10^(-11);
c = a;
while(abs(f(c)) >= tol)
% a, b - punkty ostatnio wyznaczone 
% c -  punkt wyznaczany obecnie
    c = b - ((f(b)*(b-a)) / (f(b) - f(a)));
    
    a=b;
    b=c;
    
        
    reps = reps + 1;
    %jako wynik iteracji przyjmujemy ten punkt 
    %w ktorym  wartosc f-cji jest mniejsza
    
    if(abs(f(a)) < abs(f(b)))
        x(reps,1) = a;
        y(reps,1) = f(a);
    else
        x(reps,1) = b;
        y(reps,1) = f(b);
    end
end
end
