%Programma di creazione dell'immagine

close all
clc
%immagine visiva

CampiRecettivi_visivo

I=zeros(Nv1,Nv2);
IV=zeros(Nv1,Nv2);
IVc=zeros(Nv1,Nv2);
IV(posizione_v(1),posizione_v(2))=input_v;
I=I+IV;
IVc(posizione_contrasto_v(1),posizione_contrasto_v(2))=input_v_contrasto;
I=I+IVc;

% figure
% imagesc(I)

for i=1:Nv1,
    for j=1:Nv2,
        Uv(i,j)=sum(sum(I.*Rv{i,j}));
    end
end
% figure
%     imagesc(Uv)
input_camporec_visivo=Uv;
   
 
 save immaginevisiva I
 save inputvisivo input_camporec_visivo
 
