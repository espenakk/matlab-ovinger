clear % (workspace)
clc   % clear command window
close all % lukker alle figurer

A = 1; % Tversnittareal [m^2]
K_v = 1; % Ventilkonstant []
K_o = 1; % Utgangssignal 

% Initialtilstand/startverdi
h_0 = 4; % [m]

% Tidskonstant aktuatordynamikk
T = 2; % [s]

sim tank_actuator

figure
plot(ans.waterlevel)

figure
plot(ans.valvedata)
xlabel('Tid [sekund]')
title('Ventildata')
grid