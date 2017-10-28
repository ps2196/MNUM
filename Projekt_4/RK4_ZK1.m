function [w, iter] = RK4_ZK(x01, x02)
%metoda Rungego-Kutty ze zmiennym krokiem
tic;
%warunki poczatkowe
x1 = x01;
x2 = x02;

T0 = 0;
Tk = 20;
epsw = 10^(-10);%dokladnosc wzgledna
epsb = 10^(-10);%dokladnosc bezwzgledna
s = 0.9;%korekta dlugosci kroku
beta = 5; %wspolcznniki maksymalnego wzrostu korku w jednej iteracji
hmin = 10^-12;%krok

i=1;
t(i) = T0;

w(:,1) = [x1,x2]; %wykres

iter = 1;
h =0.00001;
while(t(i) <= Tk)
    x01 = x1;
    x02 = x2;
    %krok h
    k11 = dx1(x1,x2);
    k12 = dx2(x1,x2);
    
    k21 = dx1(x1 + 0.5*h , x2 + 0.5*h*k11);
    k22 = dx2(x1 + 0.5*h , x2 + 0.5*h*k12);
    
    k31 = dx1(x1 + 0.5*h , x2 + 0.5*h*k21);
    k32 = dx2(x1 + 0.5*h , x2 + 0.5*h*k22);
    
    k41 = dx1(x1 + h , x2 + h*k31);
    k42 = dx1(x1 + h , x2 + h*k32);
    
    x1 = x1 + (1/6)*h*(k11 + 2*k21 + 2*k31 + k41);
    x2 = x2 + (1/6)*h*(k12 + 2*k22 + 2*k32 + k42);
   
    
    %krok h/2
    h = 0.5*h;
    
    k11 = dx1(x01,x02);
    k12 = dx2(x01,x02);
    
    k21 = dx1(x01 + 0.5*h , x02 + 0.5*h*k11);
    k22 = dx2(x01 + 0.5*h , x02 + 0.5*h*k12);
    
    k31 = dx1(x01 + 0.5*h , x02 + 0.5*h*k21);
    k32 = dx2(x01 + 0.5*h , x02 + 0.5*h*k22);
    
    k41 = dx1(x01 + h , x02 + h*k31);
    k42 = dx1(x01 + h , x02 + h*k32);
    
    tmp1 = x01 + (1/6)*h*(k11 + 2*k21 + 2*k31 + k41);
    tmp2 = x02 + (1/6)*h*(k12 + 2*k22 + 2*k32 + k42);
    
    %krok2
    k11 = dx1(tmp1,tmp2);
    k12 = dx2(tmp1,tmp2);
    
    k21 = dx1(tmp1 + 0.5*h , tmp2 + 0.5*h*k11);
    k22 = dx2(tmp1 + 0.5*h , tmp2 + 0.5*h*k12);
    
    k31 = dx1(tmp1 + 0.5*h , tmp2 + 0.5*h*k21);
    k32 = dx2(tmp1 + 0.5*h , tmp2 + 0.5*h*k22);
    
    k41 = dx1(tmp1 + h , tmp2 + h*k31);
    k42 = dx1(tmp1 + h , tmp2 + h*k32);
    
    tmp1 = tmp1 + (1/6)*h*(k11 + 2*k21 + 2*k31 + k41);
    tmp2 = tmp2 + (1/6)*h*(k12 + 2*k22 + 2*k32 + k42);
    
    
    
    w(: , i+1) = [x1,x2];
    
    
    h = 2*h;%powrot do poprzedniej dlugosci kroku
    %szacowanie bledow
    delta1 = (tmp1-x1)/15; % 15 = (2^p) - 1, gdzie p = 4 rzad metody
    delta2 = (tmp2-x2)/15; % 15 = (2^p) - 1, gdzie p = 4 rzad metody
    
    eps1 = abs(tmp1)*epsw + epsb;
    eps2 = abs(tmp2)*epsw + epsb;
    
    a1 = ((eps1)/(abs(delta1)))^(1/5);
    a2 = ((eps2)/(abs(delta2)))^(1/5);
    
    if(a1 > a2)
        a = a2;
    else
        a = a1;
    end
      
    hnext = s * a * h; %poprawka dlugosci kroku
   
    %if(s*a >= 1)
        %if(t(i) + h >= Tk)
         %   break
        %else
            t(i+1) = t(i) + h; %kolejny punkt
            A = [hnext, beta*h, Tk-t(i)];
            h = min(A);
            i = i+1;
            disp(h);
        %end
%     %else
%         if(hnext < hmin)
%             disp('Niemo¿liwe rozwiazanie z zadana dokladnoscia');
%             break;
%         else
%             h = hnext;
%         end
%     end

    iter = iter + 1;
    
end

%plot(w(1,:) , w(2,:)); %rysowanie wykresu

disp('Liczba iteracji = ')
disp(iter);
toc;
    
end