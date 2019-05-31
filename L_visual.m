clear%, close all, clc

% AREA VISIVA


Nv=80;
Mv=80;
NV=41;
MV=41;
sigvex=3.5;                                  
sigvin=6.3;                                                   
Lvex0=1;                                               %   Lvex0=1;                                              
Lvin0=1;                                               %   Lvin0=1;                                               


Nvmez=ceil(Nv/2);
Mvmez=ceil(Mv/2);
sigv=max(sigvex,sigvin);     % sig è il valore massimo tra la varianza di eccitazione e quella di inibizione
Nvexmez=ceil(3*sigv)+1;     % Nexmez è il n. di oscill stimolati dalla gaussiana,di var massima,nell'intervallo 0,3*var
Halfvex=Nvexmez-1;
Nvex=2*Nvexmez-1;           % n.di oscill totali stimolati dalla gaussiana di var massima(sono compresi tra +/-3*var)
iiv=([1:Nvex]'-Nvexmez)*ones(1,Nvex);
jjv=ones(Nvex,1)*([1:Nvex]-Nvexmez);
distv=iiv.^2+jjv.^2;         % crea una matrice "quadrato della distanza" dal punto centrale,di dimensioni (Nvex x Nvex)
Lvex=Lvex0*exp(-0.5*distv/(sigvex*sigvex));   % matrice gaussiana di eccitazione da applicare all'oscill interessato
Lvex(Nvexmez,Nvexmez)=0;
Lvin=Lvin0*exp(-0.5*distv/(sigvin*sigvin));   % matrice gaussiana di inibizione da applicare all'oscill interessato
Lvin(Nvexmez,Nvexmez)=0;

ratio=sum(sum(Lvin))/sum(sum(Lvex));
Lvex0=1.6;          
Lvin0=(Lvex0/ratio)*2.5;                     
Lvin=Lvin*Lvin0;
Lvex=Lvex*Lvex0;

LLvex=cell(Nv,Mv);           % matrice contente le matrici delle sinapsi laterali ecc di ciascun elemento,ha dim 40x40
LLvin=cell(Nv,Mv);           % matrice contente le matrici delle sinapsi laterali inib di ciascun elemento,ha dim 40x40
LLv=cell(NV,MV);
for i = 1:Nv,
    for j = 1:Mv, 
        LLvex{i,j}=zeros(Nv,Mv);
        LLvin{i,j}=zeros(Nv,Mv);
    end
end
for i = 1:NV,
    for j = 1:MV, 
        LLv{i,j}=zeros(NV,MV);
    end
end

for i=1:Nv,
    lvmin(i)=max(1,i-Halfvex); 
    lvmax(i)=min(Nv,i+Halfvex);     
end      


for j=1:Mv,                      
    mvmin(j)=max(1,j-Halfvex);      
    mvmax(j)=min(Mv,j+Halfvex);      
end
for i = 1:Nv
    for j=1:Mv
        
        if i<=Halfvex,
            if j<=Halfvex,
            
                lvmin2=Nv-(Halfvex-i);
                lvmax2=Nv;
                mvmin2=Mv-(Halfvex-j);
                mvmax2=Mv;
                
                lvinf=lvmin(i)-i+Halfvex+1;
                lvinf2=1;
                lvsup=lvmax(i)-i-Halfvex+Nvex;
                lvsup2=(Halfvex+1)-i;
                
                mvinf=mvmin(j)-j+Halfvex+1;
                mvinf2=1;
                mvsup=mvmax(j)-j-Halfvex+Nvex;        
                mvsup2=(Halfvex+1)-j;
                
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
                LLvex{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvex(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
                LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
                LLvin{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvin(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
                LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
                LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
                
            elseif j>Mv-Halfvex,
                
                lvmin2=Nv-(Halfvex-i);
                lvmax2=Nv;
                mvmin2=1;
                mvmax2=Halfvex-(Mv-j);
                
                lvinf=lvmin(i)-i+Halfvex+1;
                lvinf2=1;
                lvsup=lvmax(i)-i-Halfvex+Nvex;
                lvsup2=(Halfvex+1)-i;
                
                mvinf=mvmin(j)-j+Halfvex+1;
                mvinf2=Nvex-(Halfvex-(Mv-j))+1;
                mvsup=mvmax(j)-j-Halfvex+Nvex;        
                mvsup2=Nvex;
                
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
                LLvex{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvex(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
                LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
                LLvin{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvin(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
                LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
                LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            end
            
            lvmin2=Nv-(Halfvex-i);
            lvmax2=Nv;
                
            lvinf=lvmin(i)-i+Halfvex+1;    
            lvinf2=1;    
            lvsup=lvmax(i)-i-Halfvex+Nvex;    
            lvsup2=(Halfvex+1)-i;
            
            mvinf=mvmin(j)-j+Halfvex+1;    
            mvsup=mvmax(j)-j-Halfvex+Nvex;
                
                
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
            LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
            LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
            LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            
            
        elseif i>Nv-Halfvex,
            
            lvmin2=1;
            lvmax2=Halfvex-(Nv-i);
            
            if j<=Halfvex,
                
                mvmin2=Mv-(Halfvex-j);
                mvmax2=Mv;
                
                lvinf=lvmin(i)-i+Halfvex+1;
                lvinf2=Nvex-(Halfvex-(Nv-i))+1;
                lvsup=lvmax(i)-i-Halfvex+Nvex;
                lvsup2=Nvex;
                
                mvinf=mvmin(j)-j+Halfvex+1;
                mvinf2=1;
                mvsup=mvmax(j)-j-Halfvex+Nvex;        
                mvsup2=(Halfvex+1)-j;
                
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
                LLvex{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvex(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
                LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
                LLvin{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvin(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
                LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
                LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
                
            elseif j>Mv-Halfvex,
                
                mvmin2=1;
                mvmax2=Halfvex-(Mv-j);
                
                lvinf=lvmin(i)-i+Halfvex+1;
                lvinf2=Nvex-(Halfvex-(Nv-i))+1;
                lvsup=lvmax(i)-i-Halfvex+Nvex;
                lvsup2=Nvex;
                
                mvinf=mvmin(j)-j+Halfvex+1;
                mvinf2=Nvex-(Halfvex-(Mv-j))+1;
                mvsup=mvmax(j)-j-Halfvex+Nvex;        
                mvsup2=Nvex;
                
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
                LLvex{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvex(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
                LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
                LLvin{i,j}(lvmin2:lvmax2,mvmin2:mvmax2)=Lvin(lvinf2:lvsup2,mvinf2:mvsup2);
                LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
                LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
                LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            end
                
            lvinf=lvmin(i)-i+Halfvex+1;    
            lvinf2=Nvex-(Halfvex-(Nv-i))+1;    
            lvsup=lvmax(i)-i-Halfvex+Nvex;    
            lvsup2=Nvex;
            
            mvinf=mvmin(j)-j+Halfvex+1;    
            mvsup=mvmax(j)-j-Halfvex+Nvex;
                
                
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
            LLvex{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvex(lvinf2:lvsup2,mvinf:mvsup);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
            LLvin{i,j}(lvmin2:lvmax2,mvmin(j):mvmax(j))=Lvin(lvinf2:lvsup2,mvinf:mvsup);
            LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            
        end
        
        
        if j<=Halfvex,
            
            mvmin2=Mv-(Halfvex-j);
            mvmax2=Mv;    
            
            lvinf=lvmin(i)-i+Halfvex+1;
            lvsup=lvmax(i)-i-Halfvex+Nvex;
            
            mvinf=mvmin(j)-j+Halfvex+1;
            mvinf2=1;
            mvsup=mvmax(j)-j-Halfvex+Nvex;        
            mvsup2=(Halfvex+1)-j;
            
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
            LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            
        elseif j>Mv-Halfvex,
            
            mvmin2=1;
            mvmax2=Halfvex-(Mv-j);
            
            lvinf=lvmin(i)-i+Halfvex+1;
            lvsup=lvmax(i)-i-Halfvex+Nvex;
                
            mvinf=mvmin(j)-j+Halfvex+1;
            mvinf2=Nvex-(Halfvex-(Mv-j))+1;
            mvsup=mvmax(j)-j-Halfvex+Nvex;
            mvsup2=Nvex;
                
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
            LLvex{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvex(lvinf:lvsup,mvinf2:mvsup2);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
            LLvin{i,j}(lvmin(i):lvmax(i),mvmin2:mvmax2)=Lvin(lvinf:lvsup,mvinf2:mvsup2);
            LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
            
        end
        
        lvinf=lvmin(i)-i+Halfvex+1;        
        lvsup=lvmax(i)-i-Halfvex+Nvex; 
        mvinf=mvmin(j)-j+Halfvex+1;      
        mvsup=mvmax(j)-j-Halfvex+Nvex;
        LLvex{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvex(lvinf:lvsup,mvinf:mvsup);
        LLvin{i,j}(lvmin(i):lvmax(i),mvmin(j):mvmax(j))=Lvin(lvinf:lvsup,mvinf:mvsup);
        LLv80{i,j}=LLvex{i,j}-LLvin{i,j};
    end
end

NNv=ceil((NV-1)/2);
MMv=ceil((MV-1)/2);

for i = 1:NV,
    for j=1:MV,
        
        if i<=NNv+1,
            if j<=MMv+1,
                LLv{i,j}(1:i+NNv,1:j+MMv)=LLv80{i,j}(1:i+NNv,1:j+MMv);                                
                LLv{i,j}(1:i+NNv,(MMv+1)+j:MV)=LLv80{i,j}(1:i+NNv,Mv-(MV-((MMv+1)+j)):Mv);
                LLv{i,j}((NNv+1)+i:NV,1:j+(MMv))=LLv80{i,j}(Nv-(NV-((NNv+1)+i)):Nv,1:j+MMv);
                LLv{i,j}((NNv+1)+i:NV,(MMv+1)+j:MV)=LLv80{i,j}(Nv-(NV-((NNv+1)+i)):Nv,Mv-(MV-((MMv+1)+j)):Mv);
            elseif j>MMv+1,
                LLv{i,j}(1:i+NNv,1:j-(MMv+1))=LLv80{i,j+((Mv/2)-1)}(1:i+NNv,1:MMv-(Mv-(j+((Mv/2)-1))));                                
                LLv{i,j}(1:i+NNv,j-MMv:MV)=LLv80{i,j+((Mv/2)-1)}(1:i+NNv,((Mv/2)-1)+j-MMv:Mv);
                LLv{i,j}(i+(NNv+1):NV,1:j-(MMv+1))=LLv80{i,j+((Mv/2)-1)}(Nv-(NV-(i+(NNv+1))):Nv,1:MMv-(Mv-(j+((Mv/2)-1))));
                LLv{i,j}(i+(NNv+1):NV,j-MMv:MV)=LLv80{i,j+((Mv/2)-1)}(Nv-(NV-(i+(NNv+1))):Nv,((Mv/2)-1)+j-MMv:Mv);
            end
        elseif i>NNv+1,
            if j<=MMv+1,
                LLv{i,j}(1:i-(NNv+1),1:j+MMv)=LLv80{i+((Nv/2)-1),j}(1:NNv-(Nv-(i+((Nv/2)-1))),1:j+MMv);                                
                LLv{i,j}(1:i-(NNv+1),(MMv+1)+j:MV)=LLv80{i+((Nv/2)-1),j}(1:NNv-(Nv-(i+((Nv/2)-1))),Mv-(MV-((MMv+1)+j)):Mv);
                LLv{i,j}(i-NNv:NV,1:j+MMv)=LLv80{i+((Nv/2)-1),j}((((Nv/2)-1)+i)-NNv:Nv,1:j+MMv);
                LLv{i,j}(i-NNv:NV,(MMv+1)+j:MV)=LLv80{i+((Nv/2)-1),j}((((Nv/2)-1)+i)-NNv:Nv,Mv-(MV-((MMv+1)+j)):Mv);
            elseif j>MMv/2,
                LLv{i,j}(1:i-(NNv+1),1:j-(MMv+1))=LLv80{i+((Nv/2)-1),j+((Mv/2)-1)}(1:NNv-(Nv-(i+((Nv/2)-1))),1:MMv-(Mv-(j+((Mv/2)-1))));                                
                LLv{i,j}(1:i-(NNv+1),j-MMv:MV)=LLv80{i+((Nv/2)-1),j+((Mv/2)-1)}(1:NNv-(Nv-(i+((Nv/2)-1))),((Mv/2)-1)+j-MMv:Mv);
                LLv{i,j}(i-NNv:NV,1:j-(MMv+1))=LLv80{i+((Nv/2)-1),j+((Mv/2)-1)}((((Nv/2)-1)+i)-NNv:Nv,1:MMv-(Mv-(j+((Mv/2)-1))));
                LLv{i,j}(i-NNv:NV,j-MMv:MV)=LLv80{i+((Nv/2)-1),j+((Mv/2)-1)}((((Nv/2)-1)+i)-NNv:Nv,((Mv/2)-1)+j-MMv:Mv);
            end
        end
        
%         LLv{i,j}=ceil(LLv{i,j}*1000000)/1000000;
        
    end
end




save synapses_Lv LLv lvmin lvmax mvmin mvmax

% figure(3)
% for i = 1:NNv
%     for j=1:MMv
%         surfc(LLv{i,j})                                %20,20
%         opengl neverselect
%         pause(0.01)
%     end
% end

% figure
% surf(LLv{20,20})                                %i,j
% opengl neverselect