clear all
close all

sequence = [randi([0 1],1,8) 1];

for w=1:8
    errorgen(w)=rand()
end

for v=0:1:125000
    sec = randi([0 1],1,8);
    k = find(sec == 1);
    c=sec;
    if rem(length(k),2)==0
        c = [sec 0];
    else
        c = [sec 1];
    end
    sequence = [sequence;sec];
    codigo = [codigo;c];
end