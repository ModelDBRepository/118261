%% CONTRAST
% Analysis of the multisensory contrast, defined as the difference
% between the activity of a SC neuron stimulated by two cross-modal stimuli
% coming from the same location in space and the sum of the two
% unisensory responses.

clear
% a constant visual input (Iv=12) paired with an acoustic stimulus 
% of different levels of intensity

load RANGE_DIN_kv7ka6_Ivisivo_12_LuDeboli_LmForti
load RANGE_DIN_Ivisivo_LuDeboli_LmForti
load RANGE_DIN_Iacustico_LuDeboli_LmForti

somma_Iv12Ia_LuDeboli_LmForti=xm_a_regime+xm_v_regime(13);
contrast_Iv12_LuDeboli_LmForti=xm_v12_regime-somma_Iv12Ia_LuDeboli_LmForti;

figure
plot(stimoli(13:length(stimoli)),contrast_Iv12_LuDeboli_LmForti(13:length(stimoli)),'b')
title('contrast - Visual Input fixed Iv=12')
xlabel('Acoustic input')
ylabel('CONTRAST')


clear
% a constant visual input (Iv=30) paired with an acoustic stimulus 
% of different levels of intensity

load RANGE_DIN_kv7ka6_Ivisivo_30_LuDeboli_LmForti
load RANGE_DIN_Ivisivo_LuDeboli_LmForti
load RANGE_DIN_Iacustico_LuDeboli_LmForti

somma_Iv30Ia_LuDeboli_LmForti=xm_a_regime+xm_v_regime(31);
contrast_Iv30_LuDeboli_LmForti=xm_v30_regime-somma_Iv30Ia_LuDeboli_LmForti;

figure
plot(stimoli(13:length(stimoli)),contrast_Iv30_LuDeboli_LmForti(13:length(stimoli)),'b')
title('contrast - Visual Input fixed Iv=30')
xlabel('Acoustic input')
ylabel('CONTRAST')

