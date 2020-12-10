clear all
close all

fs=50*1e5;
ts=1/fs;

t=0:ts:(1e-3)-ts;

m=(2000*t)-1;

m=[m m m];
t=0:ts:(3e-3)-ts;
plot(t,m);

kp=pi/2;

yPM=cos(2*pi*1e3*t + kp*m);

figure(2)
plot(t,yPM)