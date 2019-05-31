clear,% close all, clc

% AREA ACUSTICA


Na=80;
Ma=80;
NA=41;
MA=41;
sigaex=5.3;       
sigain=11.8;                                                    
Laex0=1;                   %  Laex0=1;
Lain0=1;                   %  Lain0=1;                                                  


Namez=ceil(Na/2);
Mamez=ceil(Ma/2);
siga=max(sigaex,sigain);     % sig è il valore massimo tra la varianza di eccitazione e quella di inibizione
Naexmez=ceil(3*siga)+1;     % Nexmez è il n. di oscill stimolati dalla gaussiana,di var massima,nell'intervallo 0,3*var
Halfaex=Naexmez-1;
Naex=2*Naexmez-1;           % n.di oscill totali stimolati dalla gaussiana di var massima(sono compresi tra +/-3*var)
iia=([1:Naex]'-Naexmez)*ones(1,Naex);
jja=ones(Naex,1)*([1:Naex]-Naexmez);
dista=iia.^2+jja.^2;         % crea una matrice "quadrato della distanza" dal punto centrale,di dimensioni (Nvex x Nvex)
Laex=Laex0*exp(-0.5*dista/(sigaex*sigaex));   % matrice gaussiana di eccitazione da applicare all'oscill interessato
Laex(Naexmez,Naexmez)=0;
Lain=Lain0*exp(-0.5*dista/(sigain*sigain));   % matrice gaussiana di inibizione da applicare all'oscill interessato
Lain(Naexmez,Naexmez)=0;


ratio=sum(sum(Lain))/sum(sum(Laex));
Laex0=1;          
Lain0=(Laex0/ratio)*4;              
Lain=Lain*Lain0;
Laex=Laex*Laex0;


LLaex=cell(Na,Ma);           % matrice contente le matrici delle sinapsi laterali ecc di ciascun elemento,ha dim 40x40
LLain=cell(Na,Ma);           % matrice contente le matrici delle sinapsi laterali inib di ciascun elemento,ha dim 40x40
LLa=cell(NA,MA);
for i = 1:Na,
    for j = 1:Ma, 
        LLaex{i,j}=zeros(Na,Ma);
        LLain{i,j}=zeros(Na,Ma);
    end
end
for i = 1:NA,
    for j = 1:MA, 
        LLa{i,j}=zeros(NA,MA);
    end
end


for i=1:Na,
    lamin(i)=max(1,i-Halfaex);     
    lamax(i)=min(Na,i+Halfaex);     
end      


for j=1:Ma,                      
    mamin(j)=max(1,j-Halfaex);      
    mamax(j)=min(Ma,j+Halfaex);      
end
for i = 1:Na
    for j=1:Ma
        
        if i<=Halfaex,
            if j<=Halfaex,
            
                lamin2=Na-(Halfaex-i);
                lamax2=Na;
                mamin2=Ma-(Halfaex-j);
                mamax2=Ma;
                
                lainf=lamin(i)-i+Halfaex+1;
                lainf2=1;
                lasup=lamax(i)-i-Halfaex+Naex;
                lasup2=(Halfaex+1)-i;
                
                mainf=mamin(j)-j+Halfaex+1;
                mainf2=1;
                masup=mamax(j)-j-Halfaex+Naex;        
                masup2=(Halfaex+1)-j;
                
                LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
                LLaex{i,j}(lamin2:lamax2,mamin2:mamax2)=Laex(lainf2:lasup2,mainf2:masup2);
                LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
                LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
                LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
                LLain{i,j}(lamin2:lamax2,mamin2:mamax2)=Lain(lainf2:lasup2,mainf2:masup2);
                LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
                LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
                LLa80{i,j}=LLaex{i,j}-LLain{i,j};
                
            elseif j>Ma-Halfaex,
                
                lamin2=Na-(Halfaex-i);
                lamax2=Na;
                mamin2=1;
                mamax2=Halfaex-(Ma-j);
                
                lainf=lamin(i)-i+Halfaex+1;
                lainf2=1;
                lasup=lamax(i)-i-Halfaex+Naex;
                lasup2=(Halfaex+1)-i;
                
                mainf=mamin(j)-j+Halfaex+1;
                mainf2=Naex-(Halfaex-(Ma-j))+1;
                masup=mamax(j)-j-Halfaex+Naex;        
                masup2=Naex;
                
                LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
                LLaex{i,j}(lamin2:lamax2,mamin2:mamax2)=Laex(lainf2:lasup2,mainf2:masup2);
                LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
                LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
                LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
                LLain{i,j}(lamin2:lamax2,mamin2:mamax2)=Lain(lainf2:lasup2,mainf2:masup2);
                LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
                LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
                LLa80{i,j}=LLaex{i,j}-LLain{i,j};
            end
            
            lamin2=Na-(Halfaex-i);
            lamax2=Na;
                
            lainf=lamin(i)-i+Halfaex+1;    
            lainf2=1;    
            lasup=lamax(i)-i-Halfaex+Naex;    
            lasup2=(Halfaex+1)-i;
            
            mainf=mamin(j)-j+Halfaex+1;    
            masup=mamax(j)-j-Halfaex+Naex;
                
                
            LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
            LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
            LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
            LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
            LLa80{i,j}=LLaex{i,j}-LLain{i,j};
            
            
        elseif i>Na-Halfaex,
            
            lamin2=1;
            lamax2=Halfaex-(Na-i);
            
            if j<=Halfaex,
                
                mamin2=Ma-(Halfaex-j);
                mamax2=Ma;
                
                lainf=lamin(i)-i+Halfaex+1;
                lainf2=Naex-(Halfaex-(Na-i))+1;
                lasup=lamax(i)-i-Halfaex+Naex;
                lasup2=Naex;
                
                mainf=mamin(j)-j+Halfaex+1;
                mainf2=1;
                masup=mamax(j)-j-Halfaex+Naex;        
                masup2=(Halfaex+1)-j;
                
                LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
                LLaex{i,j}(lamin2:lamax2,mamin2:mamax2)=Laex(lainf2:lasup2,mainf2:masup2);
                LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
                LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
                LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
                LLain{i,j}(lamin2:lamax2,mamin2:mamax2)=Lain(lainf2:lasup2,mainf2:masup2);
                LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
                LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
                LLa80{i,j}=LLaex{i,j}-LLain{i,j};
                
            elseif j>Ma-Halfaex,
                
                mamin2=1;
                mamax2=Halfaex-(Ma-j);
                
                lainf=lamin(i)-i+Halfaex+1;
                lainf2=Naex-(Halfaex-(Na-i))+1;
                lasup=lamax(i)-i-Halfaex+Naex;
                lasup2=Naex;
                
                mainf=mamin(j)-j+Halfaex+1;
                mainf2=Naex-(Halfaex-(Ma-j))+1;
                masup=mamax(j)-j-Halfaex+Naex;        
                masup2=Naex;
              
                LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
                LLaex{i,j}(lamin2:lamax2,mamin2:mamax2)=Laex(lainf2:lasup2,mainf2:masup2);
                LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
                LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
                LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
                LLain{i,j}(lamin2:lamax2,mamin2:mamax2)=Lain(lainf2:lasup2,mainf2:masup2);
                LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
                LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
                LLa80{i,j}=LLaex{i,j}-LLain{i,j};
            end
            
            lainf=lamin(i)-i+Halfaex+1;    
            lainf2=Naex-(Halfaex-(Na-i))+1;    
            lasup=lamax(i)-i-Halfaex+Naex;    
            lasup2=Naex;
            
            mainf=mamin(j)-j+Halfaex+1;    
            masup=mamax(j)-j-Halfaex+Naex;
                
                
            LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
            LLaex{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Laex(lainf2:lasup2,mainf:masup);
            LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
            LLain{i,j}(lamin2:lamax2,mamin(j):mamax(j))=Lain(lainf2:lasup2,mainf:masup);
            LLa80{i,j}=LLaex{i,j}-LLain{i,j};
        end
        
        
        if j<=Halfaex,
            
            mamin2=Ma-(Halfaex-j);
            mamax2=Ma;    
            
            lainf=lamin(i)-i+Halfaex+1;
            lasup=lamax(i)-i-Halfaex+Naex;
            
            mainf=mamin(j)-j+Halfaex+1;
            mainf2=1;
            masup=mamax(j)-j-Halfaex+Naex;        
            masup2=(Halfaex+1)-j;
            
            LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
            LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
            LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
            LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
            LLa80{i,j}=LLaex{i,j}-LLain{i,j};
            
        elseif j>Ma-Halfaex,
            
            mamin2=1;
            mamax2=Halfaex-(Ma-j);
            
            lainf=lamin(i)-i+Halfaex+1;
            lasup=lamax(i)-i-Halfaex+Naex;
                
            mainf=mamin(j)-j+Halfaex+1;
            mainf2=Naex-(Halfaex-(Ma-j))+1;
            masup=mamax(j)-j-Halfaex+Naex;
            masup2=Naex;
                
            LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
            LLaex{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Laex(lainf:lasup,mainf2:masup2);
            LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
            LLain{i,j}(lamin(i):lamax(i),mamin2:mamax2)=Lain(lainf:lasup,mainf2:masup2);
            LLa80{i,j}=LLaex{i,j}-LLain{i,j};
            
        end
        
        lainf=lamin(i)-i+Halfaex+1;        
        lasup=lamax(i)-i-Halfaex+Naex; 
        mainf=mamin(j)-j+Halfaex+1;      
        masup=mamax(j)-j-Halfaex+Naex;
        LLaex{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Laex(lainf:lasup,mainf:masup);
        LLain{i,j}(lamin(i):lamax(i),mamin(j):mamax(j))=Lain(lainf:lasup,mainf:masup);
        LLa80{i,j}=LLaex{i,j}-LLain{i,j};
    end
end


NNa=ceil((NA-1)/2);
MMa=ceil((MA-1)/2);

for i = 1:NA,
    for j=1:MA,
        
        if i<=NNa+1,
            if j<=MMa+1,
                LLa{i,j}(1:i+NNa,1:j+MMa)=LLa80{i,j}(1:i+NNa,1:j+MMa);                                
                LLa{i,j}(1:i+NNa,(MMa+1)+j:MA)=LLa80{i,j}(1:i+NNa,Ma-(MA-((MMa+1)+j)):Ma);
                LLa{i,j}((NNa+1)+i:NA,1:j+(MMa))=LLa80{i,j}(Na-(NA-((NNa+1)+i)):Na,1:j+MMa);
                LLa{i,j}((NNa+1)+i:NA,(MMa+1)+j:MA)=LLa80{i,j}(Na-(NA-((NNa+1)+i)):Na,Ma-(MA-((MMa+1)+j)):Ma);
            elseif j>MMa+1,
                LLa{i,j}(1:i+NNa,1:j-(MMa+1))=LLa80{i,j+((Ma/2)-1)}(1:i+NNa,1:MMa-(Ma-(j+((Ma/2)-1))));                                
                LLa{i,j}(1:i+NNa,j-MMa:MA)=LLa80{i,j+((Ma/2)-1)}(1:i+NNa,((Ma/2)-1)+j-MMa:Ma);
                LLa{i,j}(i+(NNa+1):NA,1:j-(MMa+1))=LLa80{i,j+((Ma/2)-1)}(Na-(NA-(i+(NNa+1))):Na,1:MMa-(Ma-(j+((Ma/2)-1))));
                LLa{i,j}(i+(NNa+1):NA,j-MMa:MA)=LLa80{i,j+((Ma/2)-1)}(Na-(NA-(i+(NNa+1))):Na,((Ma/2)-1)+j-MMa:Ma);
            end
        elseif i>NNa+1,
            if j<=MMa+1,
                LLa{i,j}(1:i-(NNa+1),1:j+MMa)=LLa80{i+((Na/2)-1),j}(1:NNa-(Na-(i+((Na/2)-1))),1:j+MMa);                                
                LLa{i,j}(1:i-(NNa+1),(MMa+1)+j:MA)=LLa80{i+((Na/2)-1),j}(1:NNa-(Na-(i+((Na/2)-1))),Ma-(MA-((MMa+1)+j)):Ma);
                LLa{i,j}(i-NNa:NA,1:j+MMa)=LLa80{i+((Na/2)-1),j}((((Na/2)-1)+i)-NNa:Na,1:j+MMa);
                LLa{i,j}(i-NNa:NA,(MMa+1)+j:MA)=LLa80{i+((Na/2)-1),j}((((Na/2)-1)+i)-NNa:Na,Ma-(MA-((MMa+1)+j)):Ma);
            elseif j>MMa/2,
                LLa{i,j}(1:i-(NNa+1),1:j-(MMa+1))=LLa80{i+((Na/2)-1),j+((Ma/2)-1)}(1:NNa-(Na-(i+((Na/2)-1))),1:MMa-(Ma-(j+((Ma/2)-1))));                                
                LLa{i,j}(1:i-(NNa+1),j-MMa:MA)=LLa80{i+((Na/2)-1),j+((Ma/2)-1)}(1:NNa-(Na-(i+((Na/2)-1))),((Ma/2)-1)+j-MMa:Ma);
                LLa{i,j}(i-NNa:NA,1:j-(MMa+1))=LLa80{i+((Na/2)-1),j+((Ma/2)-1)}((((Na/2)-1)+i)-NNa:Na,1:MMa-(Ma-(j+((Ma/2)-1))));
                LLa{i,j}(i-NNa:NA,j-MMa:MA)=LLa80{i+((Na/2)-1),j+((Ma/2)-1)}((((Na/2)-1)+i)-NNa:Na,((Ma/2)-1)+j-MMa:Ma);
            end
        end
        
%         LLa{i,j}=ceil(LLa{i,j}*1000000)/1000000;
        
    end
end




save synapses_La LLa lamin lamax mamin mamax              % LLa80



% figure
% for i = 1:NA
%     for j=1:MA
%         surfc(LLa{i,j})                                %20,20
%         opengl neverselect
%         pause
%     end
% end
% 
% figure
% surfc(LLa{20,20})                                %i,j
% opengl neverselect
% 
% figure
% surfc(LLa80{40,40})                                %i,j
% opengl neverselect