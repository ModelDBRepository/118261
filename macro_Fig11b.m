%THIS FILE SIMULATES UNISENSORY AND MULTISENSORY STIMULATIONS ACCORDING TO 
%FIG.11b OF THE PAPER J.COMPUT.NEUROSCI.(2009) 26:55-73 AND
%CREATES .MAT FILES CONTAINING THE RESULTS OF THESE SIMULATIONS. SUCH .MAT
%FILES ARE THEN USED BY THE FILE GRAPHS_FIG11B.M TO CREATE THE THREE PLOTS OF
%FIG.11-b OF THE PAPER

clear
clc
close all

load synapses_La
load synapses_Lv
load synapses_Lm

posizione_m=[20 20]; 
posizione_v=[20 20]; 
posizione_a=[20 20]; 
posizione_contrasto_a=[20 14]; 
posizione_contrasto_v=[20 14]; 
input_v_contrasto=0;    
input_a_contrasto=0;    

input_input_v=[5 8 9 10 12 15 18 20 22 25 30 35];
input_input_a=[0 0 0 0 0 0 0 0 0 0 0 0];

iter=1200 
dt=0.1;
t=[0:iter]*dt;
L=length(t);


Nv=41;
Mv=41;

Gv=1;
phiv=3       
pend_v=0.3;       
Tv=3;                                                        

Na=41;
Ma=41;

Ga=1;
phia=3;      
pend_a=0.3;       
Ta=3;                                                       

Nm=41;
Mm=41;

Gm=1;
phim=6;     
pend_m=0.3;       
Tm=3;                                                      

Kv=7; 
Ka=6; 


kmv=1;   
kma=1;   

Wma=cell(Nm,Mm);
for i = 1:Nm,
    for j = 1:Mm, 
        Wma{i,j}=zeros(Nm,Mm);
        Wma{i,j}(i,j)=kma;              
    end
end


Wmv=cell(Nm,Mm);
for i = 1:Nm,
    for j = 1:Mm, 
        Wmv{i,j}=zeros(Nm,Mm);
        Wmv{i,j}(i,j)=kmv;              
    end
end


for p=1:12
    
    Iv = zeros(Nv,Mv,L);
    xv=zeros(Nv,Mv,L);         
    
    Ia = zeros(Na,Ma,L);
    xa=zeros(Na,Ma,L);         
    
    
    xm=zeros(Nm,Mm,L); 
    
    time_inputV=[0 1200]; 
    timeV=[0 200];
    
    time_inputA=[0 1200]; 
    timeA=[0 200]; 
    
    input_v=0;
    inputvisivo
    input_camporec_visivo_0=input_camporec_visivo;
    clear input_camporec_visivo
    
    input_v=input_input_v(p);
    inputvisivo
    input_camporec_visivo_N0=input_camporec_visivo;
    clear input_camporec_visivo
    
    input_a=0;
    inputacustico
    input_camporec_acustico_0=input_camporec_acustico;
    clear input_camporec_acustico
    
    input_a=input_input_a(p);
    inputacustico
    input_camporec_acustico_N0=input_camporec_acustico;
    clear input_camporec_acustico
    
    for k=1:L-1,
        dt*k;
        k
        if k >= timeV(1) & k < timeV(2),
            Iv(:,:,k)=input_camporec_visivo_0;
        else
            Iv(:,:,k)=input_camporec_visivo_N0;
        end
        if k >= timeA(1) & k < timeA(2),
            Ia(:,:,k)=input_camporec_acustico_0; 
            
        else
            Ia(:,:,k)=input_camporec_acustico_N0;
        end
    end    
    
    
    for k=1:L-1,
        dt*k;
        k
        for i = 1:Nv,
            for j = 1:Mv,
                
                in_laterali_v(i,j)=sum(sum(LLv{i,j}.*xv(:,:,k)));
                in_feedback_v(i,j)=sum(sum(Wmv{i,j}.*xm(:,:,k)));
                Sv(i,j)=in_laterali_v(i,j) + in_feedback_v(i,j); %  
                
            end
        end
        
        
        for i = 1:Na,
            for j = 1:Ma,
                
                in_laterali_a(i,j)=sum(sum(LLa{i,j}.*xa(:,:,k)));
                in_feedback_a(i,j)=sum(sum(Wma{i,j}.*xm(:,:,k)));
                Sa(i,j)=in_laterali_a(i,j) + in_feedback_a(i,j); %  
                
            end
        end
        
        
        for i = 1:Nm,
            for j = 1:Mm,
                Sm(i,j)=sum(sum(LLm{i,j}.*xm(:,:,k)));
            end
        end
        
       
        
        xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)+Sv-phiv)*pend_v))));
        %xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)+in_feedback_v-phiv)*pend_v)))); %eliminate lateral synapses 
        %xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)-phiv)*pend_v)))); %eliminate lateral and feedback synapses      
        xv(:,:,k+1)=ceil(xv(:,:,k+1)*100000000)/100000000;
        
        xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)+Sa-phia)*pend_a))));         
        %xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)+in_feedback_a-phia)*pend_a)))); %eliminate lateral synapses
        %xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)-phia)*pend_a))));  %eliminate lateral and feedback synapses                          
        xa(:,:,1+1)=ceil(xa(:,:,1+1)*100000000)/100000000;
        
        %xm(:,:,k+1)=xm(:,:,k)+dt*((1/Tm)*(-xm(:,:,k)+Gm./(1+exp(-(Kv*xv(:,:,k)+Ka*xa(:,:,k)+Sm-phim)*pend_m)))); 
        xm(:,:,k+1)=xm(:,:,k)+dt*((1/Tm)*(-xm(:,:,k)+Gm./(1+exp(-(Kv*xv(:,:,k)+Ka*xa(:,:,k)-phim)*pend_m))));%eliminate lateral synapses
        xm(:,:,k+1)=ceil(xm(:,:,k+1)*100000000)/100000000;
        
        input_acustico(k)=Ia(posizione_a(1),posizione_a(2),k)+Sa(posizione_a(1),posizione_a(2));
        input_laterali_a(k)=in_laterali_a(posizione_a(1),posizione_a(2));
        input_feedback_a(k)=in_feedback_a(posizione_a(1),posizione_a(2));
        
        input_visivo(k)=Iv(posizione_v(1),posizione_v(2),k)+Sv(posizione_v(1),posizione_v(2));
        input_laterali_v(k)=in_laterali_v(posizione_v(1),posizione_v(2));
        input_feedback_v(k)=in_feedback_v(posizione_v(1),posizione_v(2));
        
        input_multisensoriale(k)=Kv*xv(posizione_v(1),posizione_v(2),k)+Ka*xa(posizione_a(1),posizione_a(2),k)+Sm(posizione_m(1),posizione_m(2));         %
        input_A_multisensoriale(k)=Ka*xa(posizione_a(1),posizione_a(2),k);
        input_V_multisensoriale(k)=Kv*xv(posizione_v(1),posizione_v(2),k);
        input_laterali_multisens(k)=Sm(posizione_m(1),posizione_m(2));     
        
        xvplot(k)=xv(posizione_v(1),posizione_v(2),k);
        xaplot(k)=xa(posizione_a(1),posizione_a(2),k);
        xmplot(k)=xm(posizione_m(1),posizione_m(2),k);
    end
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_acustico input_laterali_a input_feedback_a'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_visivo input_laterali_v input_feedback_v -append'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_multisensoriale input_A_multisensoriale input_V_multisensoriale input_laterali_multisens -append'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 xvplot xaplot xmplot -append'])
    
    clear input_acustico input_laterali_a input_feedback_a
    clear input_visivo input_laterali_v input_feedback_v
    clear input_multisensoriale input_A_multisensoriale input_V_multisensoriale input_laterali_multisens
    clear xvplot xaplot xmplot
end


input_input_v=[5 8 9 10 12 15 18 20 22 25 30 35];
input_input_a=[5 8 9 10 12 15 18 20 22 25 30 35];

for p=1:12
    
    Iv = zeros(Nv,Mv,L);
    xv=zeros(Nv,Mv,L);         
    
    Ia = zeros(Na,Ma,L);
    xa=zeros(Na,Ma,L);         
    
    
    xm=zeros(Nm,Mm,L); 
    
    time_inputV=[0 1200]; 
    timeV=[0 200];
    
    time_inputA=[0 1200]; 
    timeA=[0 200]; 
    
    input_v=0;
    inputvisivo
    input_camporec_visivo_0=input_camporec_visivo;
    clear input_camporec_visivo
    
    input_v=input_input_v(p);
    inputvisivo
    input_camporec_visivo_N0=input_camporec_visivo;
    clear input_camporec_visivo
    
    input_a=0;
    inputacustico
    input_camporec_acustico_0=input_camporec_acustico;
    clear input_camporec_acustico
    
    input_a=input_input_a(p);
    inputacustico
    input_camporec_acustico_N0=input_camporec_acustico;
    clear input_camporec_acustico
    
    for k=1:L-1,
        dt*k;
        k
        if k >= timeV(1) & k < timeV(2),
            Iv(:,:,k)=input_camporec_visivo_0;
        else
            Iv(:,:,k)=input_camporec_visivo_N0;
        end
        if k >= timeA(1) & k < timeA(2),
            Ia(:,:,k)=input_camporec_acustico_0; 
        else
            Ia(:,:,k)=input_camporec_acustico_N0;
        end
    end    
    
    for k=1:L-1,
        dt*k;
        k
        for i = 1:Nv,
            for j = 1:Mv,
                
                in_laterali_v(i,j)=sum(sum(LLv{i,j}.*xv(:,:,k)));
                in_feedback_v(i,j)=sum(sum(Wmv{i,j}.*xm(:,:,k)));
                Sv(i,j)=in_laterali_v(i,j) + in_feedback_v(i,j); %  
                
            end
        end
        
        
        for i = 1:Na,
            for j = 1:Ma,
                
                in_laterali_a(i,j)=sum(sum(LLa{i,j}.*xa(:,:,k)));
                in_feedback_a(i,j)=sum(sum(Wma{i,j}.*xm(:,:,k)));
                Sa(i,j)=in_laterali_a(i,j) + in_feedback_a(i,j); %  
                
            end
        end
        
        
        for i = 1:Nm,
            for j = 1:Mm,
                Sm(i,j)=sum(sum(LLm{i,j}.*xm(:,:,k)));
            end
        end
        
        
        xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)+Sv-phiv)*pend_v))));
        %xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)+in_feedback_v-phiv)*pend_v)))); %eliminate lateral synapses 
        %xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)-phiv)*pend_v)))); %eliminate lateral and feedback synapses      
        xv(:,:,k+1)=ceil(xv(:,:,k+1)*100000000)/100000000;
        
        xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)+Sa-phia)*pend_a))));         
        %xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)+in_feedback_a-phia)*pend_a)))); %eliminate lateral synapses
        %xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)-phia)*pend_a))));  %eliminate lateral and feedback synapses                          
        xa(:,:,1+1)=ceil(xa(:,:,1+1)*100000000)/100000000;
        
        %xm(:,:,k+1)=xm(:,:,k)+dt*((1/Tm)*(-xm(:,:,k)+Gm./(1+exp(-(Kv*xv(:,:,k)+Ka*xa(:,:,k)+Sm-phim)*pend_m)))); 
        xm(:,:,k+1)=xm(:,:,k)+dt*((1/Tm)*(-xm(:,:,k)+Gm./(1+exp(-(Kv*xv(:,:,k)+Ka*xa(:,:,k)-phim)*pend_m))));%eliminate lateral synapses
        xm(:,:,k+1)=ceil(xm(:,:,k+1)*100000000)/100000000;
        
        input_acustico(k)=Ia(posizione_a(1),posizione_a(2),k)+Sa(posizione_a(1),posizione_a(2));
        input_laterali_a(k)=in_laterali_a(posizione_a(1),posizione_a(2));
        input_feedback_a(k)=in_feedback_a(posizione_a(1),posizione_a(2));
        
        input_visivo(k)=Iv(posizione_v(1),posizione_v(2),k)+Sv(posizione_v(1),posizione_v(2));
        input_laterali_v(k)=in_laterali_v(posizione_v(1),posizione_v(2));
        input_feedback_v(k)=in_feedback_v(posizione_v(1),posizione_v(2));
        
        input_multisensoriale(k)=Kv*xv(posizione_v(1),posizione_v(2),k)+Ka*xa(posizione_a(1),posizione_a(2),k)+Sm(posizione_m(1),posizione_m(2));         %
        input_A_multisensoriale(k)=Ka*xa(posizione_a(1),posizione_a(2),k);
        input_V_multisensoriale(k)=Kv*xv(posizione_v(1),posizione_v(2),k);
        input_laterali_multisens(k)=Sm(posizione_m(1),posizione_m(2));     
        
        xvplot(k)=xv(posizione_v(1),posizione_v(2),k);
        xaplot(k)=xa(posizione_a(1),posizione_a(2),k);
        xmplot(k)=xm(posizione_m(1),posizione_m(2),k);
    end
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_acustico input_laterali_a input_feedback_a'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_visivo input_laterali_v input_feedback_v -append'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 input_multisensoriale input_A_multisensoriale input_V_multisensoriale input_laterali_multisens -append'])
    eval(['save Iv',num2str(input_input_v(p)),'_Ia',num2str(input_input_a(p)),'_noLm_fi6 xvplot xaplot xmplot -append'])
    
    clear input_acustico input_laterali_a input_feedback_a
    clear input_visivo input_laterali_v input_feedback_v
    clear input_multisensoriale input_A_multisensoriale input_V_multisensoriale input_laterali_multisens
    clear xvplot xaplot xmplot
end


