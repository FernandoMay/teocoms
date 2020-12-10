clear all
clc

Fs=2048;
Ts=1/Fs;
L=1024;
t=(0:L-1).*Ts;
%s=2*cos(1000*t)+cos(2000*t);
s=1/(1+t^2);
subplot(2,1,1), plot(t,s),title('señal')

Y=fft(s);
P1=2.*(abs(Y(1:L/2)/L));
f=Fs.*(0:(L/2)-1)./L;
subplot(2,1,2),plot(f,P1),title('FFT')