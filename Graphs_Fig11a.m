%THIS FILE USES THE .MAT FILES GENERATED BY MACRO_FIG11A.M TO OBTAIN THE 6
%PLOTS OF FIG.11-a OF THE PAPER J.COMPUT.NEUROSCI.(2009) 26:55-73

clc
clear
close all

input_input_v=[5 8 9 10 12 15 18 20 22 25 30 35];
for i=1:length(input_input_v)

    eval(['load Iv',num2str(input_input_v(i)),'_Ia',num2str(input_input_v(i))])


    xv_find=xvplot(199)+0.9*(xvplot(end)-xvplot(199));

    i_v=find(xvplot>=xv_find);

    index_v=min(i_v);

    input_netto_v(i)=input_visivo(end);
    xv_steady(i)=xvplot(end);
    settltime_v(i)=(index_v-200)*0.1;


    xa_find=xaplot(199)+0.9*(xaplot(end)-xaplot(199));

    i_a=find(xaplot>=xa_find);

    index_a=min(i_a);

    input_netto_a(i)=input_acustico(end);
    xa_steady(i)=xaplot(end);
    settltime_a(i)=(index_a-200)*0.1;


    xm_find=xmplot(199)+0.9*(xmplot(end)-xmplot(199));

    i_m=find(xmplot>=xm_find);

    index_m=min(i_m);

    input_netto_m(i)=input_multisensoriale(end);
    input_A_m(i)=input_A_multisensoriale(end);
    input_V_m(i)=input_V_multisensoriale(end);
    input_laterali_m(i)=input_laterali_multisens(end);
    xm_steady(i)=xmplot(end);
    settltime_m(i)=(index_m-200)*0.1;
end

figure(1)
plot(input_input_v,input_V_m,'k-s')
axis([0 40 0 10]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('visual input to SC neuron','fontsize',18)

figure(2)
plot(input_input_v,input_A_m,'k-s')
axis([0 40 -2 10]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('acoustic input to SC neuron','fontsize',18)

figure(3)
plot(input_input_v,input_laterali_m,'k-s')
axis([0 40 -11 10]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('lateral input to SC neuron','fontsize',18)

figure(4)
plot(input_input_v,input_netto_m,'k-s')
axis([0 40 -10 20]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('net input to SC neuron','fontsize',18)

figure(5)
plot(input_input_v,xm_steady,'k-s')
axis([0 40 0 1.05]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('output of SC neuron','fontsize',18)

figure(6)
plot(input_input_v,settltime_m,'k-s')
axis([0 40 0 70]);
grid
set(gca,'fontsize',20)
h=get(gca,'children');
set(h,'linewidth',2)
set(h,'markersize',12)
set(h,'markeredgecolor',[0 0 0])
set(h,'markerfacecolor',[0 0 0])
xlabel('external input level','fontsize',18)
title('settling time of SC neuron (ms)','fontsize',18)

for i=1:length(input_input_v)
    
    eval(['load Iv',num2str(input_input_v(i)),'_Ia0'])
    
    xv_find=xvplot(199)+0.9*(xvplot(end)-xvplot(199));

    i_v=find(xvplot>=xv_find);

    index_v=min(i_v);

    input_netto_v(i)=input_visivo(end);
    xv_steady(i)=xvplot(end);
    settltime_v(i)=(index_v-200)*0.1;


    xa_find=xaplot(199)+0.9*(xaplot(end)-xaplot(199));

    i_a=find(xaplot>=xa_find);

    index_a=min(i_a);

    input_netto_a(i)=input_acustico(end);
    xa_steady(i)=xaplot(end);
    settltime_a(i)=(index_a-200)*0.1;


    xm_find=xmplot(199)+0.9*(xmplot(end)-xmplot(199));

    i_m=find(xmplot>=xm_find);

    index_m=min(i_m);

    input_netto_m(i)=input_multisensoriale(end);
    input_A_m(i)=input_A_multisensoriale(end);
    input_V_m(i)=input_V_multisensoriale(end);
    input_laterali_m(i)=input_laterali_multisens(end);
    xm_steady(i)=xmplot(end);
    settltime_m(i)=(index_m-200)*0.1;
end


figure(1)
hold on
plot(input_input_v,input_V_m,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])

figure(2)
hold on
plot(input_input_v,input_A_m,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])

figure(3)
hold on
plot(input_input_v,input_laterali_m,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])

figure(4)
hold on
plot(input_input_v,input_netto_m,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])

figure(5)
hold on
plot(input_input_v,xm_steady,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])

figure(6)
hold on
plot(input_input_v,settltime_m,'k-^')
h=get(gca,'children');
set(h(1),'linewidth',2)
set(h(1),'markersize',12)
set(h(1),'markeredgecolor',[0 0 0])
set(h(1),'markerfacecolor',[0.7 0.7 0.7])



