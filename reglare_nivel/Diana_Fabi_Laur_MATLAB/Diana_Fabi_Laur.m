format long
M = readmatrix('Diana_Fabi_Laur0.txt');
v = M(:,3);
t = M(:,5);
plot(v);
y0 = 40.7986;
y1 = 29.3403;
u1 = 40;
u0 = 35;
K = (y1-y0)/(u1-u0)
yT = y0 + 0.63*(y1-y0)
T = 660-544;

Hf = tf(K,[T 1])
Ho = tf(1,[T/10 1])
% Hd/Hd+1 = Ho
% Hd = HoHd + Ho
% Ho/(1-Ho) = Hd

Hr = minreal(Ho/Hf/(1-Ho))

Kp = -4.364
Ti = 1/(-0.03762/Kp)
