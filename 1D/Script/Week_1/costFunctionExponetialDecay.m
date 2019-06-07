function cost = costFunctionExponetialDecay(x, t, Smeas)



S0 = x(1);
T =x(2);



Smodel = (S0*exp(-t/T));
Sresidual = Smodel - Smeas;
cost =  sum(Sresidual.^2);

% DEBUG ONLY! 
fprintf('Cost called with S0 = %.2f, T = %.2f\n', S0, T);
figure(2)
plot( t, Smeas, '-bx', t, Smodel, '-rx')
legend('Smeas', 'Smodel')
pause(.1)

