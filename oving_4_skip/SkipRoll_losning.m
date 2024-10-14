% 
%Rullebevegelsen til et skip
clear
%
%Legger inn tilstandsrom-modell og transferfunksjonen
%Finner sprangresponsen og rampe til �pent system

%Matriser

A=[0     1;
   -0.04 -0.2]

B=[0;
   2.0E-7]

C=[1 0]

D=[0]

%d) Egenverdier
lamda=eig(A)

%Tilstandsrommodell
SSbaat=ss(A,B,C,D)
%step(SSbaat)

%B�lgemoment-konstant
K=2.0E5;
%Transferfunksjonen
s=tf('s');
%
Ks=2.0E-7;
H1=Ks/(s^2+0.2*s+0.04)
%Sprangrespons �pent system
figure(1)
step(H1*K)
grid
xlabel('Tid [s]');
ylabel('Rullevinkel ');
title('Skipets sprangrespons');

%Test av rampe �pent system
T=0:0.01:40;
U=T*K;
[Y,X]=lsim(H1,U,T);
figure(2)
plot(T,U,T,Y)
xlabel('Tid [s]');
ylabel('Rullevinkel ');
title('Skipets ramperespons');

%Lukket sl�yfe. Finner f�lgeforholdet fra b�lgemoment
%til rullevinkel med p-regulator
Kr=10;
%Sprangrespons fra forstyrrelsen i lukket system
M=feedback(K*H1,Kr)
figure(3);
step(M);
grid
xlabel('Tid [s]');
ylabel('Rullevinkel ');
title('Sprangrespons fra forstyrrelsen lukket sl�yfe');

%Lukket sl�yfe. Finner f�lgeforholdet fra referansen
%til rullevinkel med p-regulator
Kr=10;
%Sprangrespons lukket system
M=feedback(K*Kr*H1,1)
figure(4);
step(M);
grid
xlabel('Tid [s]');
ylabel('Rullevinkel ');
title('Sprangrespons referanse lukket sl�yfe');

%
%Tester rampe p� lukket system
T=0:0.01:60;
U=T;
%M=(K*Ks/Kr)/(s^2+0.2*s+0.04+Kr*Ks)   %Lukket transferfunksjon
[Y,X]=lsim(M,U,T);
figure(5)
plot(T,U,T,Y)
xlabel('Tid [s]');
ylabel('Rullevinkel ');
title('Ramperespons lukket sl�yfe')


