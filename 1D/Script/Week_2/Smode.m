function S = Smode(x, t)

S0 = x(1);
T =x(2);
freq = x(3);

S = (S0*exp(-t/T).*cos(2*pi*freq*t));