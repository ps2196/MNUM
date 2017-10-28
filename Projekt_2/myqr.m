%Rozklad QR -waski zmodyfiowanym algorytmem Grama-Schmidta
%dla macierzy nieosobliwych, kwadratowych

function [Q, R] = myqr(A)

	n = size(A, 1);
	Q = zeros(n,n);
	R = zeros(n,n);
	d = zeros(1,n);

	for i=1:n
		Q(:, i)  = A(:,i);
		R(i,i) = 1;
		d(i) =Q(:,i)' * Q(:,i);
		
		for j=i+1:n
			R(i,j) = (Q(:,i)' * A(:,j)) / d(i);
			A(:,j) = A(:,j) - R(i,j) * Q(:,i);
			
		end
	end

	%normowanie rozkladu 
	for i = 1:n
		dd = norm(Q(:,i));
		Q(:,i) = Q(:,i) / dd;
		R(i, i:n) = R(i, i:n) * dd;
	end
end