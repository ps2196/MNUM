function[av_shift, av_noshift] = symetryczne1()
	tol = 0.00001; %tolerancja dla zerowanych elementow
	
	n=5; %poczatkowy rozmiar macierzy
	
	for i=1 : 3
		reps_shift = 0; %liczba iteracji meody z przesunieciami
		reps_noshift = 0; %liczba iteracji metod bez powtorzen
		successful_shift = 0 ; %udane proby  przesunieciami
		successful_noshift = 0; %udane proby bez przesuniec
		av_noshift = 0;
		av_shift = 0;
		
		for k=1 : 30
			A = 0;
			%tworzenie macierzy symetryczne nieosobliwej nxn
			while(det(A) == 0)  
				A = rand(n,n);
				A = A + A'; % tworzy macierz symetryczna
            end
            Lns = zeros(n,1);
            Ls = zeros(n,1);
				
			%rozklad QR bez przesuniec	
			[Lns, reps, success] = eig_noshift(A,tol);
			if(success == 1)
				reps_noshift = reps_noshift + reps;
				successful_noshift = successful_noshift + 1;
			end
			
			%rozklad QR z przesunieciami
			[Ls, reps, success] = myeigshift(A, tol);
			if(success == 1)
				reps_shift = reps_shift + reps;
				successful_shift = successful_shift + 1;
			end
		end
		
		av_noshift = reps_noshift / successful_noshift; %srednia liczba iteracji bez przesuniec
		av_shift = reps_shift / successful_shift; %srednia liczba iteracji z przesunieciami
		
		fprintf('\nDla macierzy %gx%g : \nsrednia liczba iteracji dla matody z przesunieciami: %g \t(udalo sie dla %g macierzy) \nsrednia liczba iteracji dla metody bez przesuniec: %g \t(udalo sie dla %g macierzy)', n, n,av_shift, successful_shift, av_noshift, successful_noshift);
		
		n = n*2;
    end
end