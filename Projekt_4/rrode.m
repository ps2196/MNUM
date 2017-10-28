function xdot = rrode(t,x)

xdot = zeros(2,1);

xdot(1) = x(2) + x(1)*(0.5 - x(1)^2 - x(2)^2); 
xdot(2) = -x(1) + x(2)*(0.5 - x(1)^2 - x(2)^2);

end