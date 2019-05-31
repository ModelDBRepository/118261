clear,% close all, clc

% AREA ACUSTICA


Nm=80;
Mm=80;
NM=41;
MM=41;
sigmex=3.5;                  %  sigaex=5.3;       
sigmin=6.2;               %  sigain=11.8;                                                    
Lmex0=3.8;   %4.5;
Lmin0=3.3;   %3.3;


Nmmez=ceil(Nm/2);
Mmmez=ceil(Mm/2);
sigm=max(sigmex,sigmin);     % sig è il valore massimo tra la varianza di eccitazione e quella di inibizione
Nmexmez=ceil(3*sigm)+1;     % Nexmez è il n. di oscill stimolati dalla gaussiana,di var massima,nell'intervallo 0,3*var
Halfmex=Nmexmez-1;
Nmex=2*Nmexmez-1;           % n.di oscill totali stimolati dalla gaussiana di var massima(sono compresi tra +/-3*var)
iim=([1:Nmex]'-Nmexmez)*ones(1,Nmex);
jjm=ones(Nmex,1)*([1:Nmex]-Nmexmez);
distm=iim.^2+jjm.^2;         % crea una matrice "quadrato della distanza" dal punto centrale,di dimensioni (Nvex x Nvex)
Lmex=Lmex0*exp(-0.5*distm/(sigmex*sigmex));   % matrice gaussiana di eccitazione da applicare all'oscill interessato
Lmex(Nmexmez,Nmexmez)=0;
Lmin=Lmin0*exp(-0.5*distm/(sigmin*sigmin));   % matrice gaussiana di inibizione da applicare all'oscill interessato
Lmin(Nmexmez,Nmexmez)=0;

LLmex=cell(Nm,Mm);           % matrice contente le matrici delle sinapsi laterali ecc di ciascun elemento,ha dim 40x40
LLmin=cell(Nm,Mm);           % matrice contente le matrici delle sinapsi laterali inib di ciascun elemento,ha dim 40x40
LLm=cell(NM,MM);
for i = 1:Nm,
    for j = 1:Mm, 
        LLmex{i,j}=zeros(Nm,Mm);
        LLmin{i,j}=zeros(Nm,Mm);
    end
end
for i = 1:NM,
    for j = 1:MM, 
        LLm{i,j}=zeros(NM,MM);
    end
end

for i=1:Nm,
    lmmin(i)=max(1,i-Halfmex);           
    lmmax(i)=min(Nm,i+Halfmex);         
end     
for j=1:Mm,                      
    mmmin(j)=max(1,j-Halfmex);      
    mmmax(j)=min(Mm,j+Halfmex);      
end

%

for i = 1:Nm
    for j=1:Mm
        
        if i<=Halfmex,
            if j<=Halfmex,
            
                lmmin2=Nm-(Halfmex-i);
                lmmax2=Nm;
                mmmin2=Mm-(Halfmex-j);
                mmmax2=Mm;
                
                lminf=lmmin(i)-i+Halfmex+1;
                lminf2=1;
                lmsup=lmmax(i)-i-Halfmex+Nmex;
                lmsup2=(Halfmex+1)-i;
                
                mminf=mmmin(j)-j+Halfmex+1;
                mminf2=1;
                mmsup=mmmax(j)-j-Halfmex+Nmex;        
                mmsup2=(Halfmex+1)-j;
                
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
                LLmex{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmex(lminf2:lmsup2,mminf2:mmsup2);
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
                LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
                LLmin{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmin(lminf2:lmsup2,mminf2:mmsup2);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
                LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
                LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
                
            elseif j>Mm-Halfmex,
                
                lmmin2=Nm-(Halfmex-i);
                lmmax2=Nm;
                mmmin2=1;
                mmmax2=Halfmex-(Mm-j);
                
                lminf=lmmin(i)-i+Halfmex+1;
                lminf2=1;
                lmsup=lmmax(i)-i-Halfmex+Nmex;
                lmsup2=(Halfmex+1)-i;
                
                mminf=mmmin(j)-j+Halfmex+1;
                mminf2=Nmex-(Halfmex-(Mm-j))+1;
                mmsup=mmmax(j)-j-Halfmex+Nmex;        
                mmsup2=Nmex;
                
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
                LLmex{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmex(lminf2:lmsup2,mminf2:mmsup2);
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
                LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
                LLmin{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmin(lminf2:lmsup2,mminf2:mmsup2);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
                LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
                LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
            end
            
            lmmin2=Nm-(Halfmex-i);
            lmmax2=Nm;
                
            lminf=lmmin(i)-i+Halfmex+1;    
            lminf2=1;    
            lmsup=lmmax(i)-i-Halfmex+Nmex;    
            lmsup2=(Halfmex+1)-i;
            
            mminf=mmmin(j)-j+Halfmex+1;    
            mmsup=mmmax(j)-j-Halfmex+Nmex;
                
                
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
            LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
            LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
            LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
            
            
        elseif i>Nm-Halfmex,
            
            lmmin2=1;
            lmmax2=Halfmex-(Nm-i);
            
            if j<=Halfmex,
                
                mmmin2=Mm-(Halfmex-j);
                mmmax2=Mm;
                
                lminf=lmmin(i)-i+Halfmex+1;
                lminf2=Nmex-(Halfmex-(Nm-i))+1;
                lmsup=lmmax(i)-i-Halfmex+Nmex;
                lmsup2=Nmex;
                
                mminf=mmmin(j)-j+Halfmex+1;
                mminf2=1;
                mmsup=mmmax(j)-j-Halfmex+Nmex;        
                mmsup2=(Halfmex+1)-j;
                
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
                LLmex{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmex(lminf2:lmsup2,mminf2:mmsup2);
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
                LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
                LLmin{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmin(lminf2:lmsup2,mminf2:mmsup2);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
                LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
                LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
                
            elseif j>Mm-Halfmex,
                
                mmmin2=1;
                mmmax2=Halfmex-(Mm-j);
                
                lminf=lmmin(i)-i+Halfmex+1;
                lminf2=Nmex-(Halfmex-(Nm-i))+1;
                lmsup=lmmax(i)-i-Halfmex+Nmex;
                lmsup2=Nmex;
                
                mminf=mmmin(j)-j+Halfmex+1;
                mminf2=Nmex-(Halfmex-(Mm-j))+1;
                mmsup=mmmax(j)-j-Halfmex+Nmex;        
                mmsup2=Nmex;
              
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
                LLmex{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmex(lminf2:lmsup2,mminf2:mmsup2);
                LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
                LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
                LLmin{i,j}(lmmin2:lmmax2,mmmin2:mmmax2)=Lmin(lminf2:lmsup2,mminf2:mmsup2);
                LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
                LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
                LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
            end
            
            lminf=lmmin(i)-i+Halfmex+1;    
            lminf2=Nmex-(Halfmex-(Nm-i))+1;    
            lmsup=lmmax(i)-i-Halfmex+Nmex;    
            lmsup2=Nmex;
            
            mminf=mmmin(j)-j+Halfmex+1;    
            mmsup=mmmax(j)-j-Halfmex+Nmex;
                
                
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
            LLmex{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmex(lminf2:lmsup2,mminf:mmsup);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
            LLmin{i,j}(lmmin2:lmmax2,mmmin(j):mmmax(j))=Lmin(lminf2:lmsup2,mminf:mmsup);
            LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
        end
        
        
        if j<=Halfmex,
            
            mmmin2=Mm-(Halfmex-j);
            mmmax2=Mm;    
            
            lminf=lmmin(i)-i+Halfmex+1;
            lmsup=lmmax(i)-i-Halfmex+Nmex;
            
            mminf=mmmin(j)-j+Halfmex+1;
            mminf2=1;
            mmsup=mmmax(j)-j-Halfmex+Nmex;        
            mmsup2=(Halfmex+1)-j;
            
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
            LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
            
        elseif j>Mm-Halfmex,
            
            mmmin2=1;
            mmmax2=Halfmex-(Mm-j);
            
            lminf=lmmin(i)-i+Halfmex+1;
            lmsup=lmmax(i)-i-Halfmex+Nmex;
                
            mminf=mmmin(j)-j+Halfmex+1;
            mminf2=Nmex-(Halfmex-(Mm-j))+1;
            mmsup=mmmax(j)-j-Halfmex+Nmex;
            mmsup2=Nmex;
                
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
            LLmex{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmex(lminf:lmsup,mminf2:mmsup2);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
            LLmin{i,j}(lmmin(i):lmmax(i),mmmin2:mmmax2)=Lmin(lminf:lmsup,mminf2:mmsup2);
            LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
            
        end
        
        lminf=lmmin(i)-i+Halfmex+1;        
        lmsup=lmmax(i)-i-Halfmex+Nmex; 
        mminf=mmmin(j)-j+Halfmex+1;      
        mmsup=mmmax(j)-j-Halfmex+Nmex;
        LLmex{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmex(lminf:lmsup,mminf:mmsup);
        LLmin{i,j}(lmmin(i):lmmax(i),mmmin(j):mmmax(j))=Lmin(lminf:lmsup,mminf:mmsup);
        LLm80{i,j}=LLmex{i,j}-LLmin{i,j};
    end
end


NNm=ceil((NM-1)/2);
MMm=ceil((MM-1)/2);

for i = 1:NM,
    for j=1:MM,
        
        if i<=NNm+1,
            if j<=MMm+1,
                LLm{i,j}(1:i+NNm,1:j+MMm)=LLm80{i,j}(1:i+NNm,1:j+MMm);                                
                LLm{i,j}(1:i+NNm,(MMm+1)+j:MM)=LLm80{i,j}(1:i+NNm,Mm-(MM-((MMm+1)+j)):Mm);
                LLm{i,j}((NNm+1)+i:NM,1:j+(MMm))=LLm80{i,j}(Nm-(NM-((NNm+1)+i)):Nm,1:j+MMm);
                LLm{i,j}((NNm+1)+i:NM,(MMm+1)+j:MM)=LLm80{i,j}(Nm-(NM-((NNm+1)+i)):Nm,Mm-(MM-((MMm+1)+j)):Mm);
            elseif j>MMm+1,
                LLm{i,j}(1:i+NNm,1:j-(MMm+1))=LLm80{i,j+((Mm/2)-1)}(1:i+NNm,1:MMm-(Mm-(j+((Mm/2)-1))));                                
                LLm{i,j}(1:i+NNm,j-MMm:MM)=LLm80{i,j+((Mm/2)-1)}(1:i+NNm,((Mm/2)-1)+j-MMm:Mm);
                LLm{i,j}(i+(NNm+1):NM,1:j-(MMm+1))=LLm80{i,j+((Mm/2)-1)}(Nm-(NM-(i+(NNm+1))):Nm,1:MMm-(Mm-(j+((Mm/2)-1))));
                LLm{i,j}(i+(NNm+1):NM,j-MMm:MM)=LLm80{i,j+((Mm/2)-1)}(Nm-(NM-(i+(NNm+1))):Nm,((Mm/2)-1)+j-MMm:Mm);
            end
        elseif i>NNm+1,
            if j<=MMm+1,
                LLm{i,j}(1:i-(NNm+1),1:j+MMm)=LLm80{i+((Nm/2)-1),j}(1:NNm-(Nm-(i+((Nm/2)-1))),1:j+MMm);                                
                LLm{i,j}(1:i-(NNm+1),(MMm+1)+j:MM)=LLm80{i+((Nm/2)-1),j}(1:NNm-(Nm-(i+((Nm/2)-1))),Mm-(MM-((MMm+1)+j)):Mm);
                LLm{i,j}(i-NNm:NM,1:j+MMm)=LLm80{i+((Nm/2)-1),j}((((Nm/2)-1)+i)-NNm:Nm,1:j+MMm);
                LLm{i,j}(i-NNm:NM,(MMm+1)+j:MM)=LLm80{i+((Nm/2)-1),j}((((Nm/2)-1)+i)-NNm:Nm,Mm-(MM-((MMm+1)+j)):Mm);
            elseif j>MMm/2,
                LLm{i,j}(1:i-(NNm+1),1:j-(MMm+1))=LLm80{i+((Nm/2)-1),j+((Mm/2)-1)}(1:NNm-(Nm-(i+((Nm/2)-1))),1:MMm-(Mm-(j+((Mm/2)-1))));                                
                LLm{i,j}(1:i-(NNm+1),j-MMm:MM)=LLm80{i+((Nm/2)-1),j+((Mm/2)-1)}(1:NNm-(Nm-(i+((Nm/2)-1))),((Mm/2)-1)+j-MMm:Mm);
                LLm{i,j}(i-NNm:NM,1:j-(MMm+1))=LLm80{i+((Nm/2)-1),j+((Mm/2)-1)}((((Nm/2)-1)+i)-NNm:Nm,1:MMm-(Mm-(j+((Mm/2)-1))));
                LLm{i,j}(i-NNm:NM,j-MMm:MM)=LLm80{i+((Nm/2)-1),j+((Mm/2)-1)}((((Nm/2)-1)+i)-NNm:Nm,((Mm/2)-1)+j-MMm:Mm);
            end
        end
        
%         LLm{i,j}=ceil(LLm{i,j}*1000000)/1000000;
        
    end
end



save synapses_Lm LLm lmmin lmmax mmmin mmmax   %  LLm80



% figure
% for i = 1:Nm
%     for j=1:Mm
%         surfc(LLm{i,j})                                %20,20
%         opengl neverselect
%         pause
%     end
% end
% 
% figure
% surfc(LLm{20,20})                                %i,j
% opengl neverselect

% figure
% surfc(LLm80{40,40})                                %i,j
% opengl neverselect