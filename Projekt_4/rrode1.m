function xdot = rrode1(t,x1, x2)

xdot = zeros(2,1);

xdot(1) = x2 + x1*(0.5 - x1^2 - x2^2); 
xdot(2) = (-1)*x1 + x2*(0.5 - x1^2 - x2^2);
end