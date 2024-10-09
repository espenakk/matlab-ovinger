clear
clc

% Variabler
J = 5.0*10^6;       %Treghetsmoment
B = 10^6;           %Dempekonstant
K = 2.0*10^5;       %Fjærkonstant

%Transferfunksjon
teller = (2*10^-7);
nevner = ([1 0.2 0.04]);
transferfunksjon = tf(teller, nevner);

%Tilstandsrommodell
[ssA,ssB,ssC,ssD] = tf2ss(teller,nevner);
ssModell = ss(ssA,ssB,ssC,ssD);

%Verdier
egenverdi = pole(transferfunksjon);
sprangrespons = step(transferfunksjon);
stabilitet = isstable(transferfunksjon);
impulse = impulse(transferfunksjon);

%Plotting
clf;

figure(1);
%Plot sprangrespons
plot(sprangrespons, LineWidth=2)
grid
title('Sprangrespons')
xlabel('Tid [s]')
ylabel('Vinkel [\theta]')

%Simulering
Kp = 20000;         %Forsterkning regulator
sprang = 1;         %Størrelse på sprang
tstep = 0.01;       %Intervall
tstart = 0;         %Starttid
tstop = 60;         %Stopptid

tspan = [tstart, tstop];
options = simset('solver', 'ode5', 'fixedstep', tstep);
sim("skip_rullebevegelse_sim", tspan, options);

figure(2);
%Plot simulering
plot(ans.clock, ans.simout, LineWidth=2)
axis([0 tstop 0 2])
grid
title('Respons med pådrag')
xlabel('Tid [s]')
ylabel('Vinkel [\theta]')

%figure(3);
%bodeplot(transferfunksjon)
%grid
