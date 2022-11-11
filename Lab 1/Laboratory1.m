S = 4.28;
d = 2.335;
E = 49584;
h = 2.335;
minusdeltaH = 24953;
R = 8.32;
Edr = E/R;
k0 = 34930800;
rcp = 2093;
kT = 293;
V = S*h;
At = S+pi*d*h;
hA = kT*At;

ci = 10;
q = 10;
Ti = 25+273;
Tr = 25+273;
c1 = 9.35;

Tv = 300:0.001:500;
cx = -(rcp*q*(Ti-Tv)-kT*At*(Tv-Tr))./(minusdeltaH*V*k0*exp(-Edr./Tv));
cv = (q*ci)./(q+V*k0*exp(-Edr./Tv));
Q1 = -(rcp*q*(Ti-Tv)-kT*At*(Tv-Tr));
Q2 = minusdeltaH*V*k0*exp(-Edr./Tv).*cv;
figure(1)
plot(Tv, [Q1',Q2']);
xlabel('T [K]'); ylabel('Q [kJ/h]')
figure(2)
plot(Tv,cv,Tv,cx)
xlabel('T [K]'); ylabel('c [kmol/m3]')
c0 = 2.35;
T0 = 368;

tsimulare = 0:0.01:100;
[timpsimulare, Y] = ode23(@RCCA, tsimulare, [c0;T0]);
figure(3)
subplot(2,1,1); plot(timpsimulare, Y(:,1));
subplot(2,1,2); plot(timpsimulare, Y(:,2));

function Xdot = RCCA(~,X)
c = X(1); T = X(2);
if (c<0)
    c = 0;
end
k0 = evalin('base','k0');
Edr = evalin('base','Edr');
q = evalin('base','q');
ci = evalin('base','ci');
V = evalin('base','V');
rcp = evalin('base','rcp');
Ti = evalin('base','Ti');
hA= evalin('base','hA');
Tr = evalin('base','Tr');
mdH = evalin('base','minusdeltaH');
k = k0*exp(-Edr/T);
cdot = (q*(ci-c)-V*k*c)/V;
Tdot = (rcp*q*(Ti-T)+hA*(Tr-T)+mdH*V*k*c)/(rcp*V);
Xdot = [cdot;Tdot];
end