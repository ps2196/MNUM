%program rozwiazuje uklad rownan liniowych metoda Gaussa-Seidel'a
function [x] = gauss_seidl(A,b, delta)
% delta dokladnosc obliczanego wyniku
	tic;
	
	n = size(A,1); %n = ilos wierszy A
	
	x = zeros(n,1);
	xprev = ones(n,1);
	L= zeros(n,n);
	D = zeros(n,n);
	U=zeros(n,n);
	%delta = 0.0001; %oczekiwana dokladnosc
	
	for i=1 : n %A = L + D + U
		for j = 1 : n
			if(i == j)
				D(i,i) = A(i,i);
			elseif(j<i)
				L(i,j) = A(i,j);
			else
				U(i,j) = A(i,j);
			end
				
		end
	
	end
	
	while(norm( x - xprev ) > delta)
	%for i=1 : n
		xprev = x;
		w = U * x -b;
		for j = 1 : n
			sum = 0;
			for k = 1 :  j - 1
				sum = sum - L(j,k) * x(k,1);
			end
			x(j,1) = (sum - w(j,1) )/ D(j,j);
		end
	end
	
	%dokladnosc otrzymanego rozwiazania
	residuum = A * x - b;
	precission = norm(residuum,1);
	
	fprintf('\nBlad rozwiazania: %g\n' , precission);
	
	toc;
end