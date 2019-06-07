t = 0:.1:10;

% Correct values
S0 = 4;
T = pi;
noiseamp = 2;

Ssim = abs(S0 .* exp(-t./T) + noiseamp .* randn(size(t)));
plot(t, Ssim, '-bx')







