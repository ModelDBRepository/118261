% SC model. this file evaluates the activities in the SC area and in the
% two upstream unimodal areas in response to external stimuli


global posizione_v posizione_a posizione_contrasto_a posizione_contrasto_v posizione_m

load inputvisivo
load inputacustico

iter=200;        % /2
dt=1;
t=[0:iter]*dt;
L=length(t);

% AREA VISIVA

Nv=41;
Mv=41;

Gv=1;
phiv=3;
pend_v=0.3;
Tv=3;

Iv = zeros(Nv,Mv,L);
xv=zeros(Nv,Mv,L);         % NxM colonne, ognuna relativa ad un oscillatore-proprietà
                           % L righe che rappresentano l'evoluzione temporale



% AREA ACUSTICA

Na=41;
Ma=41;

Ga=1;
phia=3;
pend_a=0.3;
Ta=3;

Ia = zeros(Na,Ma,L);
xa=zeros(Na,Ma,L);         % NxM colonne, ognuna relativa ad un oscillatore-proprietà
                           % L righe che rappresentano l'evoluzione temporale


% AREA MULTISENSORIALE

Nm=41;
Mm=41;

Gm=1;
phim=3;
pend_m=0.3;
Tm=3;

xm=zeros(Nm,Mm,L); 

kv=7;                           % peso del collegamento area visiva-area multisensoriale
ka=6;                           % peso       "          area acustica-area multisensoriale


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





time_inputV=[0 (iter*dt)];
timeV=(time_inputV/dt)+1;

time_inputA=[0 (iter*dt)];
timeA=(time_inputA/dt)+1;

for k=1:L-1,
    dt*k;
    
    if k >= timeV(1) & k < timeV(2),
        Iv(:,:,k)=input_camporec_visivo;
    end
    if k >= timeA(1) & k < timeA(2),
        Ia(:,:,k)=input_camporec_acustico;
    end
    
    
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
    
    % phi è una soglia di attivazione
    
    xv(:,:,k+1)=xv(:,:,k)+dt*((1/Tv)*(-xv(:,:,k)+Gv./(1+exp(-(Iv(:,:,k)+Sv-phiv)*pend_v))));                                % area visiva       
    xv(:,:,k+1)=ceil(xv(:,:,k+1)*100000000)/100000000;
    
    xa(:,:,k+1)=xa(:,:,k)+dt*((1/Ta)*(-xa(:,:,k)+Ga./(1+exp(-(Ia(:,:,k)+Sa-phia)*pend_a))));                                % area visiva       
    xa(:,:,k+1)=ceil(xa(:,:,k+1)*100000000)/100000000;
    
    xm(:,:,k+1)=xm(:,:,k)+dt*((1/Tm)*(-xm(:,:,k)+Gm./(1+exp(-(kv*xv(:,:,k)+ka*xa(:,:,k)+Sm-phim)*pend_m))));     %          % area multisensoriale
    xm(:,:,k+1)=ceil(xm(:,:,k+1)*100000000)/100000000;
    
    input_acustico(k)=Ia(posizione_a(1),posizione_a(2),k)+Sa(posizione_a(1),posizione_a(2));
    input_laterali_a(k)=in_laterali_a(posizione_a(1),posizione_a(2));
    input_feedback_a(k)=in_feedback_a(posizione_a(1),posizione_a(2));
    
    input_visivo(k)=Iv(posizione_v(1),posizione_v(2),k)+Sv(posizione_v(1),posizione_v(2));
    input_laterali_v(k)=in_laterali_v(posizione_v(1),posizione_v(2));
    input_feedback_v(k)=in_feedback_v(posizione_v(1),posizione_v(2));
    
    input_multisensoriale(k)=kv*xv(posizione_v(1),posizione_v(2),k)+ka*xa(posizione_a(1),posizione_a(2),k)+Sm(posizione_m(1),posizione_m(2));         %
    input_A_multisensoriale(k)=ka*xa(posizione_a(1),posizione_a(2),k);
    input_V_multisensoriale(k)=kv*xv(posizione_v(1),posizione_v(2),k);
    input_laterali_multisens(k)=Sm(posizione_m(1),posizione_m(2));
    

end



for k=1:length(t),
    xvplot(k)=xv(posizione_m(1),posizione_m(2),k);
    xaplot(k)=xa(posizione_m(1),posizione_m(2),k);
    xmplot(k)=xm(posizione_m(1),posizione_m(2),k);
end

for k=1:length(t),
    xv2plot(k)=xv(posizione_contrasto_a(1),posizione_contrasto_a(2),k);
    xa2plot(k)=xa(posizione_contrasto_a(1),posizione_contrasto_a(2),k);
    xm2plot(k)=xm(posizione_contrasto_a(1),posizione_contrasto_a(2),k);
end

