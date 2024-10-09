% Definer transferfunksjonens teller og nevner
num = 2.0e-7;
den = [1 0.2 0.04];

% Lag transferfunksjonen
H = tf(num, den);
disp('Transferfunksjon H(s):');
disp(H);

% Metode 1: Bruk tf2ss for å få tilstandsrommatrisene
[A, B, C, D] = tf2ss(num, den);
disp('Tilstandsrommodell (A, B, C, D):');
A
B
C
D

% Metode 2: Bruk ss direkte på transferfunksjonen
sys = ss(H);
disp('Tilstandsrommodell ved å bruke ss:');
disp(sys);
