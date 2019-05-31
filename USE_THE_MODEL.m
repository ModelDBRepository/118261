% enter intensities of external stimuli to the neuron in position [20 14]
% (the TARGET NEURON); enter the position of ANTAGONIST STIMULI and their
% intensities.
% this program computes the activities in the 3 areas of the model in
% response to the configuration of external stimuli given as inputs

global posizione_v posizione_a posizione_contrasto_a posizione_contrasto_v posizione_m


posizione_m=[20 14];
posizione_v=[20 14];
posizione_a=[20 14];
input_v=input('intensity of the visual input to the neuron in [20 14]:\n');
input_a=input('intensity of the auditory input to the neuron in [20 14]:\n');
posizione_contrasto_a=input('enter, in square brackets, the position of the antagonist auditory neuron:\n');
posizione_contrasto_v=input('enter, in square brackets, the position of the antagonist visual neuron:\n');
input_v_contrasto=input('intensity of the visual input to the antagonist neuron:\n');
input_a_contrasto=input('intensity of the auditory input to the antagonist neuron:\n');

% generation of the inputs to the unimodal areas

inputvisivo
inputacustico

% generation of the intra-area synapses

L_auditory
L_visual
L_SC

clear

load synapses_La
load synapses_Lv
load synapses_Lm

% running the model
rete2D_A_V_SC

% GRAPHS

for k=1:length(t),
    xvplot(k)=xv(posizione_v(1),posizione_v(2),k);
    xaplot(k)=xa(posizione_a(1),posizione_a(2),k);
    xmplot(k)=xm(posizione_m(1),posizione_m(2),k);
end

for k=1:length(t),
    xv2plot(k)=xv(posizione_contrasto_v(1),posizione_contrasto_v(2),k);
    xa2plot(k)=xa(posizione_contrasto_a(1),posizione_contrasto_a(2),k);
    xm2plot(k)=xm(posizione_contrasto_a(1),posizione_contrasto_a(2),k);
end

figure

subplot(3,2,1)
plot(t,xmplot)
grid
xlabel('Time [ms]')
ylabel('SC neuron activity')
title('target neuron');

subplot(3,2,3)
plot(t,xaplot)
grid
xlabel('Time [ms]')
ylabel('auditory neuron activity')

subplot(3,2,5)
plot(t,xvplot)
grid
xlabel('Time [ms]')
ylabel('visual neuron activity')

subplot(3,2,2)
plot(t,xm2plot)
grid
xlabel('Time [ms]')
ylabel('SC neuron activity')
title('antagonist neuron');

subplot(3,2,4)
plot(t,xa2plot)
grid
xlabel('Time [ms]')
ylabel('auditory neuron activity')

subplot(3,2,6)
plot(t,xv2plot)
grid
xlabel('Time [ms]')
ylabel('visual neuron activity')

figure
for l=1:5:L-1
    subplot(3,1,1)
    pcolor(xm(:,:,l))
    caxis([0 1])
    opengl neverselect
    ylabel('SC AREA')
    
    subplot(3,1,2)
    pcolor(xv(:,:,l))
    caxis([0 1])
    opengl neverselect
    ylabel('visual AREA')

    subplot(3,1,3)
    pcolor(xa(:,:,l))
    caxis([0 1])
    opengl neverselect
    ylabel('auditory AREA')
   
    pause
end
