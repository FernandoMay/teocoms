clear all
close all

N=1e6;
A=rand(1,N);
[a,b]=hist(A,100);
base=b(2)-b(1);
area=sum(base*a);
a=a/area;
figure(1)
bar(b,a,1)
sigma2=1;

R=sqrt(2*sigma2*log(1./(1-A)));
[a,b]=hist(R,100);
base=b(2)-b(1);
area=sum(base*a);
a=a/area;
figure(2)
bar(b,a,1)

theta=rand(1,N)*2*pi;
[a,b]=hist(theta,100);
base=b(2)-b(1);
area=sum(base*a);
a=a/area;
figure(3)
bar(b,a,1)

G1=R.*sin(theta);
[a,b]=hist(G1,100);
base=b(2)-b(1);
area=sum(base*a);
a=a/area;
figure(4)
bar(b,a,1)

y=-4:0.01:4;
fy=1/(sqrt(2*pi))*exp(-0.5*y.^2);
hold on
plot(y,fy,'r','linewidth',2)
