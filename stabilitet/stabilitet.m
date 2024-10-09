clear

% Polynom som array av koeffisienter
p = [1 0 0.1 36 75 0 1];

% NB: husk nullere når vi mangler et s-ledd
% Vi kan ha nullere i front (0*s^7...), men ikke bakerst.

r = roots(p)

%%

% Definere kompleks Laplace-variabel
s = tf('s');

G = 1/(s^6+0.1*s^4+36*s^3+75*s^2+1)

num = 1;
den = p;

G = tf(num,den)

figure
pzmap(G)
%%

figure
step(G,5)

zero(G)
pole(G)