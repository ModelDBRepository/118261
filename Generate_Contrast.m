%% Evaluation of the MULTISENSORY CONTRAST (Fig. 6)
% the difference between the activity of a SCN stimulated by two cross-modal stimuli
% coming from the same location in space and the sum of the two unisensory responses.


% Visual stimulus fixed to Iv=12

clear, close all, clc

load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_stimoli=40;
stimoli=zeros(1,variabilita_stimoli);

xm_v12_regime=zeros(1,variabilita_stimoli);
xv_v12_regime=zeros(1,variabilita_stimoli);
xa_v12_regime=zeros(1,variabilita_stimoli);
xm2_v12_regime=zeros(1,variabilita_stimoli);
xv2_v12_regime=zeros(1,variabilita_stimoli);
xa2_v12_regime=zeros(1,variabilita_stimoli);


save RANGE_DIN_kv7ka6_Ivisivo_12_LuDeboli_LmForti xm_v12_regime xv_v12_regime xa_v12_regime xm2_v12_regime xv2_v12_regime xa2_v12_regime stimoli

for ciclo=1:variabilita_stimoli+1,
    ciclo;
    posizione_m=[20 20];
    posizione_v=[20 20];
    posizione_a=[20 20];
    input_v=12;
    input_a=(ciclo-1);
    input_v_contrasto=0;
    input_a_contrasto=0;
    posizione_contrasto_a=[20 15];
    posizione_contrasto_v=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC
    
    load RANGE_DIN_kv7ka6_Ivisivo_12_LuDeboli_LmForti
    
    stimoli(ciclo)=(ciclo-1);
    xm_v12_regime(ciclo)=xmplot(length(t));
    xv_v12_regime(ciclo)=xvplot(length(t));
    xa_v12_regime(ciclo)=xaplot(length(t));
    xm2_v12_regime(ciclo)=xm2plot(length(t));
    xv2_v12_regime(ciclo)=xv2plot(length(t));
    xa2_v12_regime(ciclo)=xa2plot(length(t));
    
    save RANGE_DIN_kv7ka6_Ivisivo_12_LuDeboli_LmForti xm_v12_regime xv_v12_regime xa_v12_regime xm2_v12_regime xv2_v12_regime xa2_v12_regime stimoli
end


% Visual stimulus fixed to Iv=30
clear
 
load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_stimoli=40;
stimoli=zeros(1,variabilita_stimoli);

xm_v30_regime=zeros(1,variabilita_stimoli);
xv_v30_regime=zeros(1,variabilita_stimoli);
xa_v30_regime=zeros(1,variabilita_stimoli);
xm2_v30_regime=zeros(1,variabilita_stimoli);
xv2_v30_regime=zeros(1,variabilita_stimoli);
xa2_v30_regime=zeros(1,variabilita_stimoli);

save RANGE_DIN_kv7ka6_Ivisivo_30_LuDeboli_LmForti xm_v30_regime xv_v30_regime xa_v30_regime xm2_v30_regime xv2_v30_regime xa2_v30_regime stimoli


for ciclo=1:variabilita_stimoli+1,
    ciclo;
    posizione_m=[20 20];
    posizione_v=[20 20];
    posizione_a=[20 20];
    input_v=30;
    input_a=(ciclo-1);
    input_v_contrasto=0;
    input_a_contrasto=0;
    posizione_contrasto_a=[20 15];
    posizione_contrasto_v=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC
    
    load RANGE_DIN_kv7ka6_Ivisivo_30_LuDeboli_LmForti
    
    stimoli(ciclo)=(ciclo-1);
    xm_v30_regime(ciclo)=xmplot(length(t));
    xv_v30_regime(ciclo)=xvplot(length(t));
    xa_v30_regime(ciclo)=xaplot(length(t));
    xm2_v30_regime(ciclo)=xm2plot(length(t));
    xv2_v30_regime(ciclo)=xv2plot(length(t));
    xa2_v30_regime(ciclo)=xa2plot(length(t));
    
    save RANGE_DIN_kv7ka6_Ivisivo_30_LuDeboli_LmForti xm_v30_regime xv_v30_regime xa_v30_regime xm2_v30_regime xv2_v30_regime xa2_v30_regime stimoli
end
