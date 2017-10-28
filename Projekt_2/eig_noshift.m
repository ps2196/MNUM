%Znajdowanie wartosci wlasnych metoda QR bez przesuniec
function[lambda, reps, success] = eig_noshift(A, tol)

	MAX_REPS= 2000; 	%limit powtorzen
	reps = 0;
	while(reps <= MAX_REPS & max(max(A-diag(diag(A)))) > tol)
		[Q,R] = myqr(A);
		A = R * Q;
		reps  = reps + 1;
	end
	
	if(reps >= MAX_REPS)
		%disp('przekroczono maksymalana liczbe powtorzen')
		success = 0;
        lambda = NaN;
	else
		lambda = diag(A);
        success = 1;
	
	end
end