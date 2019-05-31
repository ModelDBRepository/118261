%% INTEGRATION
% Effect of the distance between two stimuli on the integrative response of
% the SC neurons.

clear

% this creates Fig.7b: it displays the response of a SC neuron to a couple 
% of inputs with an Auditory stimulus fixed at the center of the RF and the
% second paired stimulus that could be:
% or auditory -> red line;
% or visual   -> blue line.
% it is shown also the unisensory response of the SC neuron to the centered
% Auditory stimulus alone -> green line.

load INTERACTION_multis_Afixed_I22_LuDeboli_LmForti
load INTERACTION_unim_Iv22_LuDeboli_LmForti
xmplot_v=xm_u_inib_regime_Iv22;
xvplot_v=xv_u_inib_regime_Iv22;
xaplot_v=xa_u_inib_regime_Iv22;
xm2plot_v=xm2_u_inib_regime_Iv22;
xv2plot_v=xv2_u_inib_regime_Iv22;
xa2plot_v=xa2_u_inib_regime_Iv22;

load INTERACTION_unim_Ia22_LuDeboli_LmForti
xmplot_a=xm_u_inib_regime_Ia22;
xvplot_a=xv_u_inib_regime_Ia22;
xaplot_a=xa_u_inib_regime_Ia22;
xm2plot_a=xm2_u_inib_regime_Ia22;
xv2plot_a=xv2_u_inib_regime_Ia22;
xa2plot_a=xa2_u_inib_regime_Ia22;

load RANGE_DIN_Iacustico_LuDeboli_LmForti
xm_a_unisensoriale=ones(1,length(xm_m_regime_I22_VsuA))*xm_a_regime(23);

distanza_deg=distanza*2.25;

figure
plot(distanza_deg,xm_a_unisensoriale,'g',distanza_deg,xm_m_regime_I22_VsuA,'b',distanza_deg,xmplot_a,'r')
xlabel('Position of Visual input (deg)')
ylabel('SCN normalized activity')
title('multisensory integration - auditory stimulus fixed');




clear

% this creates Fig.7a: it displays the response of a SC neuron to a couple 
% of inputs with a Visual stimulus fixed at the center of the RF and the
% second paired stimulus that could be:
% or auditory -> blue line;
% or visual   -> red line.
% it is shown also the unisensory response of the SC neuron to the centered
% Visual stimulus alone -> green line.

load INTERACTION_multis_Vfixed_I22_LuDeboli_LmForti
load INTERACTION_unim_Iv22_LuDeboli_LmForti
xmplot_v=xm_u_inib_regime_Iv22;
xvplot_v=xv_u_inib_regime_Iv22;
xaplot_v=xa_u_inib_regime_Iv22;
xm2plot_v=xm2_u_inib_regime_Iv22;
xv2plot_v=xv2_u_inib_regime_Iv22;
xa2plot_v=xa2_u_inib_regime_Iv22;

load INTERACTION_unim_Ia22_LuDeboli_LmForti
xmplot_a=xm_u_inib_regime_Ia22;
xvplot_a=xv_u_inib_regime_Ia22;
xaplot_a=xa_u_inib_regime_Ia22;
xm2plot_a=xm2_u_inib_regime_Ia22;
xv2plot_a=xv2_u_inib_regime_Ia22;
xa2plot_a=xa2_u_inib_regime_Ia22;

load RANGE_DIN_Ivisivo_LuDeboli_LmForti
xm_v_unisensoriale=ones(1,length(xm_m_regime_I22_AsuV))*xm_v_regime(23);

distanza_deg=distanza*2.25;

figure
plot(distanza_deg,xmplot_v,'r',distanza_deg,xm_v_unisensoriale,'g',distanza_deg,xm_m_regime_I22_AsuV,'b')
xlabel('Position of Auditory input (deg)')
ylabel('SCN normalized activity')
title('multisensory integration - visual stimulus fixed');

