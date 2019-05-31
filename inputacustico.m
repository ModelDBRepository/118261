%Programma di creazione dell'immagine

close all
clc
%immagine visiva

CampiRecettivi_acustico

I=zeros(Na1,Na2);
IA=zeros(Na1,Na2);
IAc=zeros(Na1,Na2);
IA(posizione_a(1),posizione_a(2))=input_a;
I=I+IA;
IAc(posizione_contrasto_a(1),posizione_contrasto_a(2))=input_a_contrasto;
I=I+IAc;
 
% figure
% imagesc(I)

for i=1:Na1,
    for j=1:Na2,
        Ua(i,j)=sum(sum(I.*Ra{i,j}));
    end
end
% figure
%     imagesc(Ua)
input_camporec_acustico=Ua;
   
 
 save immagineacustica I
 save inputacustico input_camporec_acustico
 
