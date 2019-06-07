function S = modelExponetialDecay(x, t)

S0A = x(1);
S0B = x(2);
TA =x(3);
TB = x(4);

SA = (S0A*exp(-t/TA));
SB = (S0B*exp(-t/TB));
S = SA + SB;