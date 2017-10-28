function[z] = mm2(x0)
%wyznacza pierwiastki wielomianu metoda Mullera MM2
%startujac z punktu x0

tol = 10^(-14);
MAX_REPS = 2000;
reps = 0;
tic;
x = x0;
while(abs(w(x)) >= tol && reps <= MAX_REPS)
    c = w(x); % c = w(x)
    b = dw(x); % b = w'(x)
    a = 0.5 * d2w(x); % 2a = w''(x)
    
    delta = b^2 - 4*a*c;

    if(abs(b + sqrt(delta)) >= abs(b - sqrt(delta)))
        Zmin = (-2) * c / (b + sqrt(delta));
    else
        Zmin = (-2) * c / (b - sqrt(delta));
    end
    
    x = x + Zmin;
    
    %reps = reps+1;
    %arg(reps ,1) = x;
    %val(reps,1)= w(x);
    
end
z = x;
toc;
end
