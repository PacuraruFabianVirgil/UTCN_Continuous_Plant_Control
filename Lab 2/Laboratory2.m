V = 100;
x = (10-9.32)/10;
5.81+0.632*(6.041-5.81);
Hqc = tf((6.041-5.81)/11, [5.52, 1]);
4.19+0.632*(3.96-4.19);
Hqc1 = tf((3.96-4.19)/11, [5.48, 1]);
5.81+0.632*(6.392-5.81);
Hcic = tf((6.392-5.81)/11, [5.81, 1]);
4.19+0.632*(4.608-4.19);
Hcic1 = tf((4.608-4.19)/11, [16.82, 1]);

Himpus = tf(1, [1 1]);
Hregulatorqc = Himpus/(Hqc*(1-Himpus));
Hregulator = minreal(Hregulatorqc);
Kp = Hregulator.num{1,1}(1);
Ki = Hregulator.num{1,1}(2);
Ti = 5.81;
