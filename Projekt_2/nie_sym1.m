function[av_reps] = nie_sym1()
	TOL = 0.00001; %tolerancja dla zerowanych elementow
	n=5;
	total_reps =0;
	
	for i=1 : 3
		av_reps = 0;
		OK_reps = 0; %poprawne wykonania
		total_reps = 0;
		for k=1 : 30
			A = 0;
			while(det(A) == 0) %tworznie macierzy nieosobliwej nxn
				A = rand(n,n);
            end
            
            [L, reps, correct] =  myeigshift(A, TOL);%wyznaczanie w. wlasnych metoda QR z przesunieciami
			
			if(correct == 1)
				total_reps = total_reps + reps;
				OK_reps = OK_reps + 1;
			end
		end
		av_reps = total_reps / OK_reps; %srednia liczba iteracji
		fprintf('\nDla macierzy: %gx%g', n, n);
		fprintf('\nPoprawne wykonania: %g', OK_reps);
		fprintf('\nSrednia liczba iteracji: %g\n\n', av_reps);
		
		n = n*2;
    end
end