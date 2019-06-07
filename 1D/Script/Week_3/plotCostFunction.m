% Plot cost function

N = 100;
TAguess = linspace(2, 6, N);
TBguess = linspace(0, 06, N);

fcost = zeros(N,N);

for idx = 1:N
    for jdx = 1:N
        TA_thisone = TAguess(idx); 
        TB_thisone = TBguess(jdx);
        
        fprintf('S0A,S0B = (%0.1f, %0.1f)\n', S0A_thisone, S0B_thisone);
        
        xtmp(1) = TA_thisone;
        xtmp(2) = TB_thisone;
        xtmp(3) = x(3);
        xtmp(4) = x(4);
        
        fcost(idx, jdx) = costFunctionExponetialDecay(xtmp, t, Smeas);
    end
end


figure(2)
imagesc(fcost, [0 500])
colorbar
impixelinfo



