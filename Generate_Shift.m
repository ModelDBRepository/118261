%% Evaluation of the SCN response to different stimuli whose application point shifts through the RF (Fig. 3) 

% Visual input
clear, close all, clc

load synapses_La
load synapses_Lv
load synapses_Lm


variabilita_distanza=20;
distanza=zeros(1,variabilita_distanza+1);

xm_u_shift_regime_Iv22=zeros(1,variabilita_distanza);
xv_u_shift_regime_Iv22=zeros(1,variabilita_distanza);
xa_u_shift_regime_Iv22=zeros(1,variabilita_distanza);
xm2_u_shift_regime_Iv22=zeros(1,variabilita_distanza);
xv2_u_shift_regime_Iv22=zeros(1,variabilita_distanza);
xa2_u_shift_regime_Iv22=zeros(1,variabilita_distanza);


save SHIFT_unim_Iv22_LuDeboli_LmForti xm_u_shift_regime_Iv22 xv_u_shift_regime_Iv22 xa_u_shift_regime_Iv22 xm2_u_shift_regime_Iv22 xv2_u_shift_regime_Iv22 xa2_u_shift_regime_Iv22 distanza      % Lm_u_inib_regime_I6


for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=0;
    input_v_contrasto=22;
    input_a_contrasto=0;
    posizione_contrasto_v=[20 4+(ciclo-1)];
    posizione_contrasto_a=[20 4+(ciclo-1)];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                                
    
    load SHIFT_unim_Iv22_LuDeboli_LmForti
    
    distanza(ciclo)=(ciclo-1)-10;
    xm_u_shift_regime_Iv22(ciclo)=xmplot(length(t));
    xv_u_shift_regime_Iv22(ciclo)=xvplot(length(t));
    xa_u_shift_regime_Iv22(ciclo)=xaplot(length(t));
    xm2_u_shift_regime_Iv22(ciclo)=xm2plot(length(t));
    xv2_u_shift_regime_Iv22(ciclo)=xv2plot(length(t));
    xa2_u_shift_regime_Iv22(ciclo)=xa2plot(length(t));

    save SHIFT_unim_Iv22_LuDeboli_LmForti xm_u_shift_regime_Iv22 xv_u_shift_regime_Iv22 xa_u_shift_regime_Iv22 xm2_u_shift_regime_Iv22 xv2_u_shift_regime_Iv22 xa2_u_shift_regime_Iv22 distanza

end


% Auditory input
clear

load synapses_La
load synapses_Lv
load synapses_Lm


variabilita_distanza=20;
distanza=zeros(1,variabilita_distanza+1);

xm_u_shift_regime_Ia22=zeros(1,variabilita_distanza);
xv_u_shift_regime_Ia22=zeros(1,variabilita_distanza);
xa_u_shift_regime_Ia22=zeros(1,variabilita_distanza);
xm2_u_shift_regime_Ia22=zeros(1,variabilita_distanza);
xv2_u_shift_regime_Ia22=zeros(1,variabilita_distanza);
xa2_u_shift_regime_Ia22=zeros(1,variabilita_distanza);


save SHIFT_unim_Ia22_LuDeboli_LmForti xm_u_shift_regime_Ia22 xv_u_shift_regime_Ia22 xa_u_shift_regime_Ia22 xm2_u_shift_regime_Ia22 xv2_u_shift_regime_Ia22 xa2_u_shift_regime_Ia22 distanza

for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=0;
    input_v_contrasto=0;
    input_a_contrasto=22;
    posizione_contrasto_v=[20 4+(ciclo-1)];
    posizione_contrasto_a=[20 4+(ciclo-1)];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                              
    
    load SHIFT_unim_Ia22_LuDeboli_LmForti
    
    distanza(ciclo)=(ciclo-1)-10;
    
    xm_u_shift_regime_Ia22(ciclo)=xmplot(length(t));
    xv_u_shift_regime_Ia22(ciclo)=xvplot(length(t));
    xa_u_shift_regime_Ia22(ciclo)=xaplot(length(t));
    xm2_u_shift_regime_Ia22(ciclo)=xm2plot(length(t));
    xv2_u_shift_regime_Ia22(ciclo)=xv2plot(length(t));
    xa2_u_shift_regime_Ia22(ciclo)=xa2plot(length(t));

    save SHIFT_unim_Ia22_LuDeboli_LmForti xm_u_shift_regime_Ia22 xv_u_shift_regime_Ia22 xa_u_shift_regime_Ia22 xm2_u_shift_regime_Ia22 xv2_u_shift_regime_Ia22 xa2_u_shift_regime_Ia22 distanza
end




% Multisensory input
clear

load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_distanza=20;
distanza=zeros(1,variabilita_distanza+1);

xm_m_shift_regime_I22=zeros(1,variabilita_distanza);
xv_m_shift_regime_I22=zeros(1,variabilita_distanza);
xa_m_shift_regime_I22=zeros(1,variabilita_distanza);
xm2_m_shift_regime_I22=zeros(1,variabilita_distanza);
xv2_m_shift_regime_I22=zeros(1,variabilita_distanza);
xa2_m_shift_regime_I22=zeros(1,variabilita_distanza);


save SHIFT_multis_I22_LuDeboli_LmForti xm_m_shift_regime_I22 xv_m_shift_regime_I22 xa_m_shift_regime_I22 xm2_m_shift_regime_I22 xv2_m_shift_regime_I22 xa2_m_shift_regime_I22 distanza

for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=0;
    input_v_contrasto=22;
    input_a_contrasto=22;
    posizione_contrasto_v=[20 4+(ciclo-1)];
    posizione_contrasto_a=[20 4+(ciclo-1)];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC  
    
    load SHIFT_multis_I22_LuDeboli_LmForti
    
    distanza(ciclo)=(ciclo-1)-10;
    
    xm_m_shift_regime_I22(ciclo)=xmplot(length(t));
    xv_m_shift_regime_I22(ciclo)=xvplot(length(t));
    xa_m_shift_regime_I22(ciclo)=xaplot(length(t));
    xm2_m_shift_regime_I22(ciclo)=xm2plot(length(t));
    xv2_m_shift_regime_I22(ciclo)=xv2plot(length(t));
    xa2_m_shift_regime_I22(ciclo)=xa2plot(length(t));

    save SHIFT_multis_I22_LuDeboli_LmForti xm_m_shift_regime_I22 xv_m_shift_regime_I22 xa_m_shift_regime_I22 xm2_m_shift_regime_I22 xv2_m_shift_regime_I22 xa2_m_shift_regime_I22 distanza
end


