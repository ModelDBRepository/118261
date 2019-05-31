%% Evaluation of the Unisensory Inhibitions


clear, close all, clc


% VISUAL


load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_distanza=19;
distanza=zeros(1,variabilita_distanza+1);

xm_u_inib_regime_Iv22=zeros(1,variabilita_distanza);
xv_u_inib_regime_Iv22=zeros(1,variabilita_distanza);
xa_u_inib_regime_Iv22=zeros(1,variabilita_distanza);
xm2_u_inib_regime_Iv22=zeros(1,variabilita_distanza);
xv2_u_inib_regime_Iv22=zeros(1,variabilita_distanza);
xa2_u_inib_regime_Iv22=zeros(1,variabilita_distanza);


save INTERACTION_unim_Iv22_LuDeboli_LmForti xm_u_inib_regime_Iv22 xv_u_inib_regime_Iv22 xa_u_inib_regime_Iv22 xm2_u_inib_regime_Iv22 xv2_u_inib_regime_Iv22 xa2_u_inib_regime_Iv22 distanza


for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=22;
    input_a=0;
    input_v_contrasto=22;
    input_a_contrasto=0;
    posizione_contrasto_v=[20 14+(ciclo-1)];
    posizione_contrasto_a=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                                 
    
    load INTERACTION_unim_Iv22_LuDeboli_LmForti
    
    distanza(ciclo)=ciclo-1;
    xm_u_inib_regime_Iv22(ciclo)=xmplot(length(t));
    xv_u_inib_regime_Iv22(ciclo)=xvplot(length(t));
    xa_u_inib_regime_Iv22(ciclo)=xaplot(length(t));
    xm2_u_inib_regime_Iv22(ciclo)=xm2plot(length(t));
    xv2_u_inib_regime_Iv22(ciclo)=xv2plot(length(t));
    xa2_u_inib_regime_Iv22(ciclo)=xa2plot(length(t));

    save INTERACTION_unim_Iv22_LuDeboli_LmForti xm_u_inib_regime_Iv22 xv_u_inib_regime_Iv22 xa_u_inib_regime_Iv22 xm2_u_inib_regime_Iv22 xv2_u_inib_regime_Iv22 xa2_u_inib_regime_Iv22 distanza
end



% AUDITORY 

clear

load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_distanza=19;
distanza=zeros(1,variabilita_distanza+1);

xm_u_inib_regime_Ia22=zeros(1,variabilita_distanza);
xv_u_inib_regime_Ia22=zeros(1,variabilita_distanza);
xa_u_inib_regime_Ia22=zeros(1,variabilita_distanza);
xm2_u_inib_regime_Ia22=zeros(1,variabilita_distanza);
xv2_u_inib_regime_Ia22=zeros(1,variabilita_distanza);
xa2_u_inib_regime_Ia22=zeros(1,variabilita_distanza);

save INTERACTION_unim_Ia22_LuDeboli_LmForti xm_u_inib_regime_Ia22 xv_u_inib_regime_Ia22 xa_u_inib_regime_Ia22 xm2_u_inib_regime_Ia22 xv2_u_inib_regime_Ia22 xa2_u_inib_regime_Ia22 distanza



for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=22;
    input_v_contrasto=0;
    input_a_contrasto=22;
    posizione_contrasto_a=[20 14+(ciclo-1)];
    posizione_contrasto_v=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                                 
    
    load INTERACTION_unim_Ia22_LuDeboli_LmForti
    
    distanza(ciclo)=ciclo-1;
    xm_u_inib_regime_Ia22(ciclo)=xmplot(length(t));
    xv_u_inib_regime_Ia22(ciclo)=xvplot(length(t));
    xa_u_inib_regime_Ia22(ciclo)=xaplot(length(t));
    xm2_u_inib_regime_Ia22(ciclo)=xm2plot(length(t));
    xv2_u_inib_regime_Ia22(ciclo)=xv2plot(length(t));
    xa2_u_inib_regime_Ia22(ciclo)=xa2plot(length(t));

    save INTERACTION_unim_Ia22_LuDeboli_LmForti xm_u_inib_regime_Ia22 xv_u_inib_regime_Ia22 xa_u_inib_regime_Ia22 xm2_u_inib_regime_Ia22 xv2_u_inib_regime_Ia22 xa2_u_inib_regime_Ia22 distanza
end



%% Evaluation of Cross-modal Integration (Figs. 7a and 7b central panels) 

clear, close all, clc

% CROSS-INTERACTION with an Auditory stimulus fixed in the center of the RF
% of a SC neuron

load synapses_La
load synapses_Lv
load synapses_Lm


variabilita_distanza=19;
distanza=zeros(1,variabilita_distanza+1);

xm_m_regime_I22_VsuA=zeros(1,variabilita_distanza);
xv_m_regime_I22_VsuA=zeros(1,variabilita_distanza);
xa_m_regime_I22_VsuA=zeros(1,variabilita_distanza);
xm2_m_regime_I22_VsuA=zeros(1,variabilita_distanza);
xv2_m_regime_I22_VsuA=zeros(1,variabilita_distanza);
xa2_m_regime_I22_VsuA=zeros(1,variabilita_distanza);

save INTERACTION_multis_Afixed_I22_LuDeboli_LmForti xm_m_regime_I22_VsuA xv_m_regime_I22_VsuA xa_m_regime_I22_VsuA xm2_m_regime_I22_VsuA xv2_m_regime_I22_VsuA xa2_m_regime_I22_VsuA distanza


for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=0;
    input_a=22;
    input_v_contrasto=22;
    input_a_contrasto=0;
    posizione_contrasto_v=[20 14+(ciclo-1)];
    posizione_contrasto_a=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                                 
    
    load INTERACTION_multis_Afixed_I22_LuDeboli_LmForti
    distanza(ciclo)=(ciclo-1);
    xm_m_regime_I22_VsuA(ciclo)=xmplot(length(t));
    xv_m_regime_I22_VsuA(ciclo)=xvplot(length(t));
    xa_m_regime_I22_VsuA(ciclo)=xaplot(length(t));
    xm2_m_regime_I22_VsuA(ciclo)=xm2plot(length(t));
    xv2_m_regime_I22_VsuA(ciclo)=xv2plot(length(t));
    xa2_m_regime_I22_VsuA(ciclo)=xa2plot(length(t));

    save INTERACTION_multis_Afixed_I22_LuDeboli_LmForti xm_m_regime_I22_VsuA xv_m_regime_I22_VsuA xa_m_regime_I22_VsuA xm2_m_regime_I22_VsuA xv2_m_regime_I22_VsuA xa2_m_regime_I22_VsuA distanza
end


% CROSS-INTERACTION with a Visual stimulus fixed in the center of the RF
% of a SC neuron

clear

load synapses_La
load synapses_Lv
load synapses_Lm

variabilita_distanza=19;
distanza=zeros(1,variabilita_distanza+1);

xm_m_regime_I22_AsuV=zeros(1,variabilita_distanza);
xv_m_regime_I22_AsuV=zeros(1,variabilita_distanza);
xa_m_regime_I22_AsuV=zeros(1,variabilita_distanza);
xm2_m_regime_I22_AsuV=zeros(1,variabilita_distanza);
xv2_m_regime_I22_AsuV=zeros(1,variabilita_distanza);
xa2_m_regime_I22_AsuV=zeros(1,variabilita_distanza);

save INTERACTION_multis_Vfixed_I22_LuDeboli_LmForti xm_m_regime_I22_AsuV xv_m_regime_I22_AsuV xa_m_regime_I22_AsuV xm2_m_regime_I22_AsuV xv2_m_regime_I22_AsuV xa2_m_regime_I22_AsuV distanza


for ciclo=1:variabilita_distanza+1,
    ciclo;
    posizione_m=[20 14];
    posizione_v=[20 14];
    posizione_a=[20 14];
    input_v=22;
    input_a=0;
    input_v_contrasto=0;
    input_a_contrasto=22;
    posizione_contrasto_a=[20 14+(ciclo-1)];
    posizione_contrasto_v=[20 15];
    inputvisivo
    inputacustico
    
    rete2D_A_V_SC                                
    
    load INTERACTION_multis_Vfixed_I22_LuDeboli_LmForti
    distanza(ciclo)=(ciclo-1);
    xm_m_regime_I22_AsuV(ciclo)=xmplot(length(t));
    xv_m_regime_I22_AsuV(ciclo)=xvplot(length(t));
    xa_m_regime_I22_AsuV(ciclo)=xaplot(length(t));
    xm2_m_regime_I22_AsuV(ciclo)=xm2plot(length(t));
    xv2_m_regime_I22_AsuV(ciclo)=xv2plot(length(t));
    xa2_m_regime_I22_AsuV(ciclo)=xa2plot(length(t));

    save INTERACTION_multis_Vfixed_I22_LuDeboli_LmForti xm_m_regime_I22_AsuV xv_m_regime_I22_AsuV xa_m_regime_I22_AsuV xm2_m_regime_I22_AsuV xv2_m_regime_I22_AsuV xa2_m_regime_I22_AsuV distanza
end

