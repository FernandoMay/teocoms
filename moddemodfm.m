clear all
close all

fs=50*500;
ts=1/fs;

fc=250;

t0=0.15;
t=0:ts:t0;

m=1*(t>=0 & t<=t0/3) -2*(t>t0/3 & t<=2*t0/3);

figure(1)
plot(t,m)
axis([0 t0 -2.5 1.5])

N=50000;
M=fftshift(fft(m,N))*ts;

w=linspace(-fs/2,fs/2,N)*2*pi;

figure(2)
plot(w,abs(M))
axis([-1000 1000 0 1.1*max(abs(M))])
title('Espectro de magnitud de m(t)')
ylabel('Magnitud')
xlabel('f')

Intm=cumsum(m)*ts;
yfm=cos(2*pi*fc*t + 100*pi*Intm);

figure(3)
plot(t,yfm)

YFM=fftshift(fft(yfm,N))*ts;

figure(4)
plot(w/(2*pi),abs(YFM))
axis([-1000 1000 0 1.1*max(abs(YFM))])

%DEMODULACIÓN

yfm_rec=yfm;
yfm_rec1=[0 yfm_rec];
yfm_rec2=[yfm_rec 0];

yfm_rec=(yfm_rec2-yfm_rec1)/ts;
yfm_rec=yfm_rec(1:end-1);
yfm_rec(1)=yfm_rec(2);

I=find(yfm_rec<0);
yfm_rec(I)=0;

figure(5)
plot(t,yfm_rec)
%axis([0 t0 -1 1])

YFMREC=fftshift(fft(yfm_rec,N))*ts;

figure(6)
plot(w/(2*pi),abs(YFMREC))
axis([-1000 1000 0 1.1*max(abs(YFMREC))])

tf=-1:ts:1;
h=80*(sin(80*tf)/(80*tf));

figure(7)
plot(tf,h)

H=fftshift(fft(h,N))*ts;

figure(8)
plot(w/(2*pi),abs(H))
axis([-1000 1000 0 1.1*max(abs(H))])

m_rec=conv(yfm_rec,h,'same')*ts;

figure(9)
kf=100*pi;
plot(t,(m_rec-2*pi*fc)/kf)


