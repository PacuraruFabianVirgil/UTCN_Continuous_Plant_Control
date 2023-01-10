%% My Data
C = 8.45;
u0 = 6.3;
k = 0.043;

A = 332.5;
k1 = 0.624;
k2 = -0.015;
k3 = -0.0006;

k11 = k2^2+4*(k-k3)*k1;
k12 = 8*(k-k3);
k13 = 2*(k-k3);
keta = 8*10^(-5);

kp = (20-16.9)/3/0.5;
hTp = 16.9+0.63*(20-16.9);
Tp = 216; % the time in which we get to hTp
Hp = tf(kp,[Tp 1])

To = Tp/4;
Ho = tf(1,[To 1])

Hr = minreal(1/Hp*Ho/(1-Ho))

Pcomp = 1.935; % identify the proportional part of the controller
Icomp = 0.008961; % identify the integral part of the controller

kcompensare = (6.8-6.3)/(37.8-34.7);
