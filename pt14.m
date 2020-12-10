clear all
close all

fmax=150000;
fs=50*fmax;
ts=1/fs;
fc=100000;
kp=1;
kf=1000*pi;

t=0:ts:2*pi/100;

m=2*cos(100*t)+18*cos(2000*pi*t);
plot(t,m)

N=500000;
figure(2)
M=fftshift(fft(m,N))*ts;
w=linspace(-fs/2,fs/2,N)*2*pi;
plot(w/(2*pi),abs(M))
axis([-1500 1500 0 1.1*max(abs(M))])

ypm=10*cos(2*pi*fc*t + kp*m);
Ypm=fftshift(fft(ypm,N))*ts;
figure(3)
plot(w/(2*pi),abs(Ypm))
axis([-150000 150000 0 1.1*max(abs(Ypm))])

Int_m=cumsum(m)*ts;
yfm=10*cos(2*pi*fc*t + kf*Int_m);
Yfm=fftshift(fft(yfm,N))*ts;
figure(4)
plot(w/(2*pi),abs(Yfm)/max(abs(Yfm)))
axis([0.5e5 150000 0 1.1])
