clear all
close all

fs=50*500;
ts=1/fs;

t0=0.15;
fc=200;
kf=2*pi*50;

t=0:ts:t0;

m=1*(t>=0 & t<t0/3)-2*(t>=t0/3 & t<2*t0/3);
plot(t,m);
axis([0 t0 -2.5 1.5])

c=cos(2*pi*fc*t);

figure(2)
plot(t,c)

Int_m=cumsum(m)*ts;

figure(3)
plot(t,Int_m)
axis([0 t0 -0.08 0.08])

yFM=cos(2*pi*fc*t + kf*Int_m);

figure(4)
plot(t,yFM)