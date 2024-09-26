clear
clc

% Variabler
Ra = 10;    %Ankerresistans
La = 1;     %Ankerinduktans
Kt = 1;     %Motorkonstant
Ke = Kt;    %Motorkonstant
Jm = 0.01;  %Treghetsmoment
b = 0.001;  %Friksjon

A = [-Ra/La, 0, -Ke/La;0, 0, 1;Kt/Jm, 0, -b/Jm];
B = [1/La;0;0];
C = [0,1,0];
D = 0;
Modell = ss(A,B,C,D);

Modell_transfer = tf(Modell);
Modell_egenverdi = pole(Modell);
Modell_sprangrespons = step(Modell);
Modell_stabilitet = isstable(Modell);

clf;

figure(1);
%%Plot sprangrespons
plot(Modell_sprangrespons, LineWidth=2)
grid
title('Sprangrespons')
xlabel('Tid [s]')
ylabel('Vinkel [\theta]')

%%Simulering
Kp = 1;
tstep = 0.01;
tstart = 0;
tstop = 15;
tspan = [tstart, tstop];
options = simset('solver', 'ode5', 'fixedstep', tstep);
sim("posisjonsservo_sim", tspan, options);

figure(2);
%%Plot simulering
plot(ans.clock, ans.simout, LineWidth=2)
axis([0 tstop 0 1.5])
grid
title('Sprangrespons')
xlabel('Tid [s]')
ylabel('Vinkel [\theta]')
