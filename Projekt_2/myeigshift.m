function [lambda, total_resp, success] = eig_shift(A, tol)
	n = size(A,1);
	lambda = diag(zeros(n));
	Submatrix = A; %
	MAX_REPS = 2000;% limit iteracji
	total_resp = 0;
	success = 1;
	
	for k=n:-1:2
		DK = Submatrix;
		
		reps = 0;%liczba iteracji rozkladu
		while( reps <= MAX_REPS & max(abs(DK(k,1:k-1))) > tol)
			RD = DK(k-1:k, k-1:k);%RD macierz 2x2 z prwego dolnego rogu
			p = [1,   -(RD(1,1) + RD(2,2)) ,  RD(2,2) * RD(1,1) - RD(1,2) * RD(2,1)];
			%p  - wspó³czynniki wielomianu cahrakterystycznego macierzy RD
			
			r = roots(p); % wartosci wlasne RD
			
			if(abs(r(1,1) - RD(2,2)) < abs(r(2,1) - RD(2,2)))
				shift = r(1,1);
			else
				shift = r(2,1);
			end
			
			DK = DK - eye(k) * shift; %przesuniecie DK
			[Q,R] = myqr(DK); %roklad QR macierzy DK
			DK = R * Q + eye(k)*shift;
			reps = reps+1;
			total_resp = total_resp + 1;
		end
		
		if(i>MAX_REPS) %przekroczono limit iteracji
			%disp('Przekroczono maksymalna liczbe iteracji');
			success = 0;
		end
			lambda(k) = DK(k,k); %element w prawym dolnym rogu jest wart. walasna A
		
		if(k>2)
			Submatrix = DK(1: k-1, 1:k-1); %deflacja
		else%DK jest macierza 2x2
			lambda(1) = DK(1,1);
		end
	end
end