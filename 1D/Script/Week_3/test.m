t = 0:.1:10;

% STep 1: Synhesize measured datat
S0Atrue = 4;
S0Btrue = 0.3;
TAtrue = pi;
TBtrue = 2.6;
noiseamp = 0.01;
Smeas_A = S0Atrue .* exp(-t./TAtrue);
Smeas_B = S0Btrue .* exp(-t./TBtrue);
Smeas = Smeas_A + Smeas_B + noiseamp .* randn(size(t));

plot(t,Smeas_A,'-bx', t,Smeas_B, '-yx', t, Smeas,'-gx')


% Step 2: Make an initial guess
S0Afit = 10.2;
S0Bfit = 0.7;
TAfit = 3;
TBfit = 2.9;
x0 =[ S0Afit, S0Bfit, TAfit, TBfit];
S = modelExponetialDecay(x0, t);

% Plot them together,
plot( t, Smeas, '-bx', t, S, '-rx')
legend('Smeas', 'Smodel')


Sresidual = S - Smeas;

plot( t, Smeas, '-bx', t, S, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Smodel','Sresidual')

% Ccalculate cost
cost =  sum(Sresidual.^2);
fprintf('Cost = %f\n', cost)

fcost = @(x)costFunctionExponetialDecay(x, t, Smeas);
[x,fval] = fminunc(fcost,x0);

Sfit = modelExponetialDecay(x,t);
Sresidual = Sfit - Smeas;
plot( t, Smeas, '-bx', t, Sfit, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Sfit','Sresidual')

S0Aerror = (x(1) - S0Atrue)/S0Atrue*100;
S0Berror = (x(2) - S0Btrue)/S0Btrue*100;
TAerror = (x(3) - TAtrue)/TAtrue*100;
TBerror = (x(4) - TBtrue)/TBtrue*100;

fprintf('Solution: S0A=%f, S0B=%f, TA=%f, TB=%f\n', x(1), x(2), x(3), x(4));
fprintf('True: S0A=%f, S0B=%f, TA=%f, TB=%f\n', S0Atrue, S0Btrue, TAtrue, TBtrue);
fprintf('Error: S0A=%.2f%%, S0B=%.2f%%, TA=%.2f%%, TB=%.2f%%\n', S0Aerror, S0Berror, TAerror, TBerror);





