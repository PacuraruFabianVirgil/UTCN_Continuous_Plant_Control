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
Hp = tf(kp,[Tp 1]);

To = Tp/4;
Ho = tf(1,[To 1]);

Hr = minreal(1/Hp*Ho/(1-Ho))

Pcomp = 1.935; % identify the proportional part of the controller
Icomp = 0.008961; % identify the integral part of the controller

kcompensare = (6.8-6.3)/(37.8-34.7);

kp2 = (39.5-34.7)/(6.8-6.3);
qTp2 = 34.7+0.63*(39.5-34.7);
Tp2 = 0.79; % the time in which we get to qTp2
Hp2 = tf(kp2,[Tp2 1]);

To2 = Tp2/4;
Ho2 = tf(1,[To2 1]);

Hr2 = minreal(1/Hp2*Ho2/(1-Ho2))
Pcomp2 = 0.4167; % identify the proportional part of the controller
Icomp2 = 0.5274; % identify the integral part of the controller

kcompensare2 = (39.5-34.7)/(21.83-16.9);

kp3 = (21.83-16.9)/3/(39.5-34.7);
hTp3 = 16.9+0.63*(21.83-16.9);
Tp3 = 348.6; % the time in which we get to hTp3
Hp3 = tf(kp3,[Tp3 1]);

To3 = Tp3/4;
Ho3 = tf(1,[To3 1]);

Hr3 = minreal(1/Hp3*Ho3/(1-Ho3))
Pcomp3 = 11.68; % identify the proportional part of the controller
Icomp3 = 0.03352; % identify the integral part of the controller

