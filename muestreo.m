clear all
close all

fs=50*300;
ts=1/fs;
fmax=300;
fn=2*fmax; %Frecuencia de Nyquist

t=-10/300:ts:10/300;

m=4*cos(200*pi*t) + 7*cos(400*pi*t) + 5*cos(600*pi*t);

figure(1)
plot(t,m)
N=10000;
M=fftshift(fft(m,N))*ts;
w=linspace(-fs/2,fs/2,N)*2*pi;

figure(2)
plot(w/(2*pi),abs(M))
axis([-500 500 0 1.1*max(abs(M))])

Fs=800;
Ts=1/Fs;

tn=-10/300:Ts:10/300;
n=4*cos(200*pi*tn) + 7*cos(400*pi*tn) + 5*cos(600*pi*tn);

figure(1)
hold on
stem(tn,n,'r')

m2=4*cos(200*pi*tn) + 7*cos(400*pi*tn) + 5*cos(600*pi*tn);
figure(3)
stem(tn,m2)
M2=fftshift(fft(m2,N))*ts;

figure(4)
plot(w/(2*pi),abs(M2))
