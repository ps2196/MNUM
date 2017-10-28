function [p] =  RK4variable (x1,x2)
    tic;
    a=0; %poczatek przedzialu
    b=20; %koniec przedzialu
    %h=0.011; %pocz�tkowa wartosc kroku
    %x1=6; %poczatkowa wartosc x1
    %x2=0; %poczatkowa wartosc x2
    s=0.9; %wsp�czynnik bezpiecze�stwa
    B=5; %heurystyczny wspo�czynnik
    hmin=0.00000001;
    
    
    epsw = 10^-5; %dokladnosc wzgledna
    epsb = 10^-5; %dokladnosc bezwzgledna
    
    i=1;
    time(i)=a;
    p(:,1)=[x1 x2];
    
    licz=0;
	
	h=0.0002
    
    while(time(i)<=b)
        
        licz=licz+1;  
           
        %oszacowanie wartosci bledu wedlug zasady podwojnego kroku
        
        %krok 1
        
        h=0.5*h;
        k11 = dx1(x1,x2);
        k12 = dx2(x1,x2);
        
        k21 = dx1(x1+0.5*h,x2+0.5*h*k11);
        k22 = dx2(x1+0.5*h,x2+0.5*h*k12);
        
        k31 = dx1(x1+0.5*h,x2+0.5*h*k21);
        k32 = dx2(x1+0.5*h,x2+0.5*h*k22);
        
        k41 = dx1(x1+h,x2+h*k31);
        k42 = dx2(x1+h,x2+h*k32); %k32
        
        tmp1 = x1+(h/6)*(k11+k41+2*(k21+k31));
        tmp2 = x2+(h/6)*(k12+k42+2*(k22+k32)); 
        
        %krok 2
        
        k11 = dx1(tmp1,tmp2);
        k12 = dx2(tmp1,tmp2);
        
        k21 = dx1(tmp1+0.5*h,tmp2+0.5*h*k11);
        k22 = dx2(tmp1+0.5*h,tmp2+0.5*h*k12);
        
        k31 = dx1(tmp1+0.5*h,tmp2+0.5*h*k21);
        k32 = dx2(tmp1+0.5*h,tmp2+0.5*h*k22);
        
        k41 = dx1(tmp1+h,tmp2+h*k31);
        k42 = dx2(tmp1+h,tmp2+h*k32); %k32
        
        tmp1 = tmp1+1/6*h*(k11+k41+2*(k21+k31)); %wczesniej bylo tmp1 i tmp2
        tmp2 = tmp2+1/6*h*(k12+k42+2*(k22+k32)); 
        
        h=2*h; %powrot do normalnej wartosci kroku
        
         %wyliczenie normalnej wartosci
        
        k11 = dx1(x1,x2);
        k12 = dx2(x1,x2);
        
        k21 = dx1(x1+0.5*h,x2+0.5*h*k11);
        k22 = dx2(x1+0.5*h,x2+0.5*h*k12);
        
        k31 = dx1(x1+0.5*h,x2+0.5*h*k21);
        k32 = dx2(x1+0.5*h,x2+0.5*h*k22);
        
        k41 = dx1(x1+h,x2+h*k31);
        k42 = dx2(x1+h,x2+h*k32);
        
        x1 = x1+1/6*h*(k11+k41+2*(k21+k31));
        x2 = x2+1/6*h*(k12+k42+2*(k22+k32));
        
        p(:,i+1)=[x1 x2];

        delta1=(tmp1-x1)/15; %rzad rowny 4 
        delta2=(tmp2-x2)/15; %rzad rowny 4
        
        eps1=abs(tmp1)*epsw+epsb; %parametry dokladnosci obliczen
        eps2=abs(tmp2)*epsw+epsb; %
        
        alpha1=(eps1/abs(delta1))^(1/5); 
        alpha2=(eps2/abs(delta2))^(1/5);
        
        if alpha1>alpha2 %wspolczynnik wyliczony dla najbardziej krytycznego rozwiazania
            alpha=alpha2;
        else
            alpha=alpha1;
        end
        hnext=s*alpha*h;
        
%         if s*alpha>=1
%             if time(i)+h >= b
%                 break
%             else
                time(i+1)=time(i)+h;
                
                A=[hnext,B*h,b-time(i)];
                h=min(A);
                disp(h);
                i=i+1;
%             end
%         else
%             if hnext < hmin
%                 disp('niemozliwe rozwiazanie z zadana dokladnoscia');
%                 break
%             else
%                 h=hnext;
%             end
%         end
            
    end
    
    fprintf('Ilosc krokow to: %d.\n',licz);
    t=toc;
    fprintf('Czas obliczen to: %d.\n',t);
end
   