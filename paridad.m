clear all
close all

numbits = 1000000;
sequence = randi([0 1],1,numbits);
codigo = [];
seq = [];
c = [];

for v=1:8:numbits
    sec = sequence(:,v:v+7);
    k = find(sec == 1);
    
    if rem(length(k),2)==0
        c = [sec 0];
    else
        c = [sec 1];
    end
    seq = [seq;sec];
    codigo = [codigo;c];
end

seq
codigo
ruidoso = codigo;
errorgen=[0 0 0 0 0 0 0 0];

NR = [0.001 0.005 0.01 0.05 0.1 0.5];

for q=1:9:numbits
    for w=1:8
        errorgen(w)=rand()
        if errorgen(w) <= NR(5)
            ruidoso(q+w-1) = ~ruidoso(q+w-1)
        end
    end
end

ruidoso
secrec = [];
buenos = [];
malos = [];

for t=1:numbits/8
    secrec = ruidoso(t,1:9);
    h = find(secrec == 1);
    if rem(length(h),2)==0
        buenos = [buenos:secrec];  
    else
        malos = [malos:secrec];
    end
end

errores = codigo == ruidoso;
incidencias = find(errores == 0)
NR(5)
numincidencias = length(incidencias)

