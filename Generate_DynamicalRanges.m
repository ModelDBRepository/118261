%% Evaluation of the Dynamical Ranges (Fig. 4)

clear, close all, clc


load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_stimoli=40;
stimoli=zeros(1,variabilita_stimoli);

xm_v_regime=zeros(1,variabilita_stimoli);
xv_v_regime=zeros(1,variabilita_stimoli);
xa_v_regime=zeros(1,variabilita_stimoli);
xm2_v_regime=zeros(1,variabilita_stimoli);
xv2_v_regime=zeros(1,variabilita_stimoli);
xa2_v_regime=zeros(1,variabilita_stimoli);

xm_a_regime=zeros(1,variabilita_stimoli);
xv_a_regime=zeros(1,variabilita_stimoli);
xa_a_regime=zeros(1,variabilita_stimoli);
xm2_a_regime=zeros(1,variabilita_stimoli);
xv2_a_regime=zeros(1,variabilita_stimoli);
xa2_a_regime=zeros(1,variabilita_stimoli);

xm_m_regime=zeros(1,variabilita_stimoli);
xv_m_regime=zeros(1,variabilita_stimoli);
xa_m_regime=zeros(1,variabilita_stimoli);
xm2_m_regime=zeros(1,variabilita_stimoli);
xv2_m_regime=zeros(1,variabilita_stimoli);
xa2_m_regime=zeros(1,variabilita_stimoli);


save RANGE_DIN_Ivisivo_LuDeboli_LmForti xm_v_regime xv_v_regime xa_v_regime xm2_v_regime xv2_v_regime xa2_v_regime stimoli 
save RANGE_DIN_Iacustico_LuDeboli_LmForti xm_a_regime xv_a_regime xa_a_regime xm2_a_regime xv2_a_regime xa2_a_regime stimoli 
save RANGE_DIN_Imultisensoriale_LuDeboli_LmForti xm_m_regime xv_m_regime xa_m_regime xm2_m_regime xv2_m_regime xa2_m_regime stimoli 


% Visual Dynamical Range

for ciclo=1:variabilita_stimoli+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=(ciclo-1);                      
    input_a=0;
    input_v_contrasto=0;
    input_a_contrasto=0;
    posizione_contrasto_a=[24 19];
    posizione_contrasto_v=[24 19];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC 
    
    load RANGE_DIN_Ivisivo_LuDeboli_LmForti
    
    stimoli(ciclo)=(ciclo-1);                       
    xm_v_regime(ciclo)=xmplot(length(t));
    xv_v_regime(ciclo)=xvplot(length(t));
    xa_v_regime(ciclo)=xaplot(length(t));
    xm2_v_regime(ciclo)=xm2plot(length(t));
    xv2_v_regime(ciclo)=xv2plot(length(t));
    xa2_v_regime(ciclo)=xa2plot(length(t));

    save RANGE_DIN_Ivisivo_LuDeboli_LmForti xm_v_regime xv_v_regime xa_v_regime xm2_v_regime xv2_v_regime xa2_v_regime stimoli 
end

% Auditory Dynamical Range

variabilita_stimoli=40;
for ciclo=1:variabilita_stimoli+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=(ciclo-1);                
    input_v_contrasto=0;
    input_a_contrasto=0;
    posizione_contrasto_a=[24 19];
    posizione_contrasto_v=[24 19];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC      
    
    load RANGE_DIN_Iacustico_LuDeboli_LmForti
    
    stimoli(ciclo)=(ciclo-1);               
    xm_a_regime(ciclo)=xmplot(length(t));
    xv_a_regime(ciclo)=xvplot(length(t));
    xa_a_regime(ciclo)=xaplot(length(t));
    xm2_a_regime(ciclo)=xm2plot(length(t));
    xv2_a_regime(ciclo)=xv2plot(length(t));
    xa2_a_regime(ciclo)=xa2plot(length(t));

    save RANGE_DIN_Iacustico_LuDeboli_LmForti xm_a_regime xv_a_regime xa_a_regime xm2_a_regime xv2_a_regime xa2_a_regime stimoli 
end

% Multisensory Dynamical Range

variabilita_stimoli=40;             
for ciclo=1:variabilita_stimoli+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=(ciclo-1);                
    input_a=(ciclo-1);                
    input_v_contrasto=0;
    input_a_contrasto=0;
    posizione_contrasto_a=[24 19];
    posizione_contrasto_v=[24 19];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                               
    
    load RANGE_DIN_Imultisensoriale_LuDeboli_LmForti
    
    stimoli(ciclo)=(ciclo-1);                             
    xm_m_regime(ciclo)=xmplot(length(t));
    xv_m_regime(ciclo)=xvplot(length(t));
    xa_m_regime(ciclo)=xaplot(length(t));
    xm2_m_regime(ciclo)=xm2plot(length(t));
    xv2_m_regime(ciclo)=xv2plot(length(t));
    xa2_m_regime(ciclo)=xa2plot(length(t));

    save RANGE_DIN_Imultisensoriale_LuDeboli_LmForti xm_m_regime xv_m_regime xa_m_regime xm2_m_regime xv2_m_regime xa2_m_regime stimoli 
end

