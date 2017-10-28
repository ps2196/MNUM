%Piotr Slysz
%zadanie 1.26.1
%wyznaczanie dokladnosci maszynowej

function [epsilon] = machine_precission()
epsilon = 1;
exponent = 0;
while( 1 + epsilon/2 > 1)  
      epsilon = epsilon/2;
      exponent  = exponent + 1;
end
fprintf('esp = 2^(-%g) = %g', exponent, epsilon);
end
