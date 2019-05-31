
close all


Nv1=41;
Nv2=41;
Rv=cell(Nv1,Nv2);
V0=1;
sv=1.5; 

lv=[1:1:Nv1]';
kv=[1:1:Nv2];
Rigv=ones(1,Nv2); 
Colv=ones(Nv1,1); 
for i = 1:Nv1,
    
    y0v=i;
    for j=1:Nv2,
    
    x0v=j;
    distanzav_x=abs(kv-x0v);
    controllo_distv_x=double((abs(kv-x0v)>(Nv2/2)));
    distanzav_y=abs(lv-y0v);
    controllo_distv_y=double((abs(lv-y0v)>(Nv1/2)));
    D2v=((distanzav_y-sign(controllo_distv_y)*Nv1).^2)*Rigv+Colv*((distanzav_x-sign(controllo_distv_x)*Nv2).^2);% matrice delle distanze al quadrato FORMA CIRCOLARE
    Rv{i,j}= V0*exp(-D2v/2/sv/sv);
    end
end 
% figure
% imagesc(Rv{2,20})

