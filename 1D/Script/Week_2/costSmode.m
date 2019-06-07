function cost = costSmode(x, t, Smeas)



S0 = x(1);
T =x(2);
freq = x(3);


Smodel = (S0*exp(-t/T).*cos(2*pi*freq*t));
Sresidual = Smodel - Smeas;
cost =  sum(Sresidual.^2);

% DEBUG ONLY! 
fprintf('Cost called with S0 = %.2f, T = %.2f, freq = %.f\n', S0, T, freq);
figure(2)
plot( t, Smeas, '-bx', t, Smodel, '-rx')
legend('Smeas', 'Smodel')
pause(.1)

