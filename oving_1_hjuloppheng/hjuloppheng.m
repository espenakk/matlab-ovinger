clear % (workspace)
clc   % clear command window
close all % lukker alle figurer

% Parametre
M1 = 10; % Kg
M2 = 400; % Kg
B = 500; % Ns / m
K1 = 20000; % N / m
K2 = 10000; % N / m

% Sprang i underlaget 
X00 = 0;
X01 = 0.1; % m
X0_step = 1; % s

% Sinusvariasjon i underlaget 
u0 = 0.1; % amplitude
w0 = 1.0; % rad/s

%Starter simuleringen av "hjulsim"
tstep = 0.01;
tstart = 0;
tstop = 10;
tspan = [tstart tstop];
options = simset('solver','ode5','fixedstep',tstep);
sim("hjuloppheng_sim", tspan, options);

% Kaller fram figur 1 og fjerner tidligere plot
figure(1);
clf;

% Plotter posisjon og hastighet etter at simuleringen er ferdig
subplot(2,1,1)
plot(ans.t, ans.X1)

% Axis([0 tstop 0 0.5])
grid
title('Hjulets utslag')

% xlabel('Tid [s]')
ylabel('Posisjon  [m]')
subplot(2,1,2)
plot(ans.t, ans.X2)
axis([])
% Axis([0 tstop 4e5 9e5])
grid
title('Bilens utslag')
xlabel('Tid [s]')
ylabel('Posisjon  [m]')
