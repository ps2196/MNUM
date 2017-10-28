function[x, y] = bi_sec(a, b)
%[a,b] - przedzial w ktorym szukamy pierwiastkow funkcji
% a - lewy koniec przedzialu
% b - prawy koniec przedzialu
tol = 10^(-11); % oczekiwana dokladnosc
reps = 0;
c = a; %pierwiastk funkcji
while ( abs(f(c)) >= tol)
    c = (a + b)/2;
    %fprintf('a = %g, b = %g, c= %g\n',a,b,c);
    %ustalamy nowy przedzial wybierajac ten dla ktorego iloczyn wartosci
    %funkcji na krancach jest ujemny
    if(f(a) * f(c) < 0)
        b = c;
    else if(f(b) * f(c) < 0)
        a = c;
    end;
    reps = reps + 1;
    x(reps, 1) = c;
    y(reps, 1) = f(c);
    
end;  
end;


