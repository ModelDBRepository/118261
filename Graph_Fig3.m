%% SHIFT
% The simulated normalized activity of a superior colliculus
% Neuron (SCN) evoked by an input whose application point shifts
% through the receptive field.
% Visual input      -> red line
% Auditory input    -> green line
% Cross-modal input -> blue line

clear

figure

load SHIFT_multis_I22_LuDeboli_LmForti
load SHIFT_unim_Iv22_LuDeboli_LmForti
load SHIFT_unim_Ia22_LuDeboli_LmForti
distanza_deg=distanza*2.25;
plot(distanza_deg,xm_m_shift_regime_I22,'b',distanza_deg,xm_u_shift_regime_Iv22,'r',distanza_deg,xm_u_shift_regime_Ia22,'g')
title('SHIFT');
xlabel('Relative position in deg in the RF')
ylabel('SCN normalized activity')