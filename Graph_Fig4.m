%% DYNAMICAL RANGES
% the SC activity is evaluated in response to different sensory modality
% external stimuli, at different intensities:
% red line   -> response to multisensory stimuli;
% blu line   -> response to visual stimuli;
% green line -> response to auditory stimuli.

clear

load RANGE_DIN_Ivisivo_LuDeboli_LmForti
load RANGE_DIN_Iacustico_LuDeboli_LmForti
load RANGE_DIN_Imultisensoriale_LuDeboli_LmForti

somma_IvIa=xm_v_regime+xm_a_regime;

figure
plot(stimoli,xm_m_regime,'r',stimoli,xm_v_regime,'b',stimoli,xm_a_regime,'g',stimoli,somma_IvIa,'k') %
title('Dynamical ranges');
xlabel('input intensity')
ylabel('SCN normalized activity')