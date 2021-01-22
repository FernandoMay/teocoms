clear all
close all

numbits = 10000
sequence = randi([0 1],1,numbits)
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

for v=1:9:numbits
    for w=1:8
        errorgen(w)=rand()
        if errorgen(w) <= NR(1)
            ruidoso(v+w-1) = ~ruidoso(v+w-1)
        end
    end
end

ruidoso

errores = codigo == ruidoso
incidencias = find(errores == 0)
numincidencias = length(incidencias)
