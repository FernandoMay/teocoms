clear all
clc

fs=2;
n=16;
dt=1/fs;
t=(0:n-1)*dt;
x=(1+t.^2).^-1;

subplot(2,1,1)
tt=0:0.05:8;
xx=tt.*exp(-tt);
plot(tt,xx,'b',t,x,'ro','markersize',4,'markeredgecolor','r','markerfacecolor','r')
xlabel('t')
ylabel('x')
title('f(t)')

subplot(2,1,2)
wc=pi*fs;
ww=-4*pi:0.1:4*pi;
Fw=1./(1+1i*ww).^2;

y=fft(x,n);
g=fftshift(y);
dw=2*pi/(n*dt);
w=(-n/2:n/2-1)*dw;

plot(ww,abs(Fw),'b',w,abs(g)/fs,'ro','markersize',3,'markeredgecolor','r','markerfacecolor','r')
set(gca,'XTick',-4*pi:2*pi:4*pi)
set(gca,'XTickLabel',{'-4\pi','-2\pi','0','2\pi','4\pi'})
xlim([-4*pi,4*pi])
xlabel('\omega')
ylabel('\|F(w)|')
title('Transformada')
