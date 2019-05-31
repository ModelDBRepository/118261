
close all


Na1=41;
Na2=41;
Ra=cell(Na1,Na2);
A0=1;
sa=2;

la=[1:1:Na1]';
ka=[1:1:Na2];
Riga=ones(1,Na2);  
Cola=ones(Na1,1);  
for i = 1:Na1,
   
    y0a=i;
    for j=1:Na2,
    
    x0a=j;
    D2a=((abs(la-y0a)-sign(double((abs(la-y0a)>(Na1/2))))*Na1).^2)*Riga+Cola*((abs(ka-x0a)-sign(double((abs(ka-x0a)>(Na2/2))))*Na2).^2);   % matrice delle distanze al quadrato FORMA CIRCOLARE
    Ra{i,j}= A0*exp(-D2a/2/sa/sa);
    end
end 
% figure
% imagesc(Ra{40,30})


    
    