%% MIMO DT dataset
clear all;close all;clc;
filename = 'peltierMIMOStepSecA.mat';
load(filename);
%input and output in string format
uArrayA=[simout(:,10) simout(:,11)];
yArrayA=[simout(:,5) simout(:,6) simout(:,7) simout(:,8) simout(:,9)];
filename = 'peltierMIMOStepSecB.mat';
load(filename);
%input and output in string format
uArrayB=[simout(:,10) simout(:,11)];
yArrayB=[simout(:,5) simout(:,6) simout(:,7) simout(:,8) simout(:,9)];
filename = 'peltierMIMOStepSecC.mat';
load(filename);
%input and output in string format
uArrayC=[simout(:,10) simout(:,11)];
yArrayC=[simout(:,5) simout(:,6) simout(:,7) simout(:,8) simout(:,9)];

figure()
subplot(3,6,1)
plot(yArrayA(:,2))
title('T11')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,2)
plot(yArrayA(:,1))
title('T12')
subplot(3,6,3)
plot(yArrayB(:,2))
title('T13')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,4)
plot(yArrayB(:,1))
title('T14')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,5)
plot(yArrayC(:,2))
title('T15')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,6)
plot(yArrayC(:,1))
title('T16')
xlabel('Time (s)')
ylabel('Temperature (^OC)')


subplot(3,6,7:8)
plot(yArrayA(:,3))
title('Section A Center Temp')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,9:10)
plot(yArrayB(:,3))
title('Section B Center Temp')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,11:12)
plot(yArrayC(:,3))
title('Section C Center Temp')
xlabel('Time (s)')
ylabel('Temperature (^OC)')

subplot(3,6,13)
plot(yArrayA(:,5))
title('T21')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,14)
plot(yArrayA(:,4))
title('T22')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,15)
plot(yArrayB(:,5))
title('T23')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,16)
plot(yArrayB(:,4))
title('T24')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,17)
plot(yArrayC(:,5))
title('T25')
xlabel('Time (s)')
ylabel('Temperature (^OC)')
subplot(3,6,18)
plot(yArrayC(:,4))
title('T26')
xlabel('Time (s)')
ylabel('Temperature (^OC)')

%Peltier experimental data arrangement
timeVec=0:1:1000;
timeVec=timeVec';
T11=[timeVec yArrayA(:,2)];
T12=[timeVec yArrayA(:,1)];
T13=[timeVec yArrayB(:,2)];
T14=[timeVec yArrayB(:,1)];
T15=[timeVec yArrayC(:,2)];
T16=[timeVec yArrayC(:,1)];

T21=[timeVec yArrayA(:,5)];
T22=[timeVec yArrayA(:,4)];
T23=[timeVec yArrayB(:,5)];
T24=[timeVec yArrayB(:,4)];
T25=[timeVec yArrayC(:,5)];
T26=[timeVec yArrayC(:,4)];

PWM1=[timeVec simout(:,10)];
PWM2=[timeVec simout(:,11)];

%central tap
TAM=[timeVec yArrayA(:,3)];
TBM=[timeVec yArrayB(:,3)];
TCM=[timeVec yArrayC(:,3)];



% figure()
% subplot(2,6,1)
% plot(yArrayA(:,2))
% title('Element [1,1]')
% subplot(2,6,2)
% plot(yArrayA(:,1))
% title('Element [1,2]')
% subplot(2,6,3)
% plot(yArrayB(:,2))
% title('Element [1,3]')
% subplot(2,6,4)
% plot(yArrayB(:,1))
% title('Element [1,4]')
% subplot(2,6,5)
% plot(yArrayC(:,2))
% title('Element [1,5]')
% subplot(2,6,6)
% plot(yArrayC(:,1))
% title('Element [1,6]')
% 
% subplot(2,6,7)
% plot(yArrayA(:,5))
% title('Element [2,1]')
% subplot(2,6,8)
% plot(yArrayA(:,4))
% title('Element [2,2]')
% subplot(2,6,9)
% plot(yArrayB(:,5))
% title('Element [2,3]')
% subplot(2,6,10)
% plot(yArrayB(:,4))
% title('Element [2,4]')
% subplot(2,6,11)
% plot(yArrayC(:,5))
% title('Element [2,5]')
% subplot(2,6,12)
% plot(yArrayC(:,4))
% title('Element [2,6]')



tempAvg500=[ mean(yArrayA(1:500,2))   mean(yArrayA(1:500,1))   mean(yArrayB(1:500,2))   mean(yArrayB(1:500,1))   mean(yArrayC(1:500,2))   mean(yArrayC(1:500,1));...  
    mean(yArrayA(1:500,5))   mean(yArrayA(1:500,4))   mean(yArrayB(1:500,5))   mean(yArrayB(1:500,4))   mean(yArrayC(1:500,5))   mean(yArrayC(1:500,4))]

tempAvg1000=[ mean(yArrayA(500:end,2))   mean(yArrayA(500:end,1))   mean(yArrayB(500:end,2))   mean(yArrayB(500:end,1))   mean(yArrayC(500:end,2))   mean(yArrayC(500:end,1));...  
    mean(yArrayA(500:end,5))   mean(yArrayA(500:end,4))   mean(yArrayB(500:end,5))   mean(yArrayB(500:end,4))   mean(yArrayC(500:end,5))   mean(yArrayC(500:end,4))]

figure()
subplot(1,2,1)
heatmap(tempAvg500, 'Colormap', hot)
title('Peltier Temperature distribution from 1s to 500s')
xlabel('Horizontal volumetric element')
ylabel('Vertical volumetric element')
subplot(1,2,2)
heatmap(tempAvg1000, 'Colormap', hot)
title('Peltier Temperature distribution from 500s to 1000s')
xlabel('Horizontal volumetric element')
ylabel('Vertical volumetric element')



%% load control data
filename = 'peltierMIMOStepSecA.mat';
load(filename);
%input and output in string format
uArrayControl=[simout(:,10) simout(:,11)];
yArrayControl=[simout(:,5) simout(:,6) simout(:,7) simout(:,8) simout(:,9)];

figure()
subplot(2,3,1)
plot(yArrayControl(:,1))
subplot(2,3,2)
plot(yArrayControl(:,2))
subplot(2,3,3)
plot(yArrayControl(:,3))
subplot(2,3,4)
plot(yArrayControl(:,4))
subplot(2,3,5)
plot(yArrayControl(:,5))

figure()
subplot(1,2,1)
plot(uArrayControl(:,1)*100/255)
title('PWM Duty Cycle Peltier Cell 1')
xlim([0 1000])
xlabel('Time (s)')
ylabel('Duty Cycle (%)')
subplot(1,2,2)
plot(uArrayControl(:,2)*100/255)
title('PWM Duty Cycle Peltier Cell 2')
xlabel('Time (s)')
ylabel('Duty Cycle (%)')
xlim([0 1000])

filename = 'peltierMIMOIdent_P1_0_P2_255.mat';
load(filename);
%input and output in string format
uArrayControl=[simout(:,10) simout(:,11)];
yArrayControl=[simout(:,5) simout(:,6) simout(:,7) simout(:,8) simout(:,9)];

figure()
subplot(2,3,1)
plot(yArrayControl(:,1))
subplot(2,3,2)
plot(yArrayControl(:,2))
subplot(2,3,3)
plot(yArrayControl(:,3))
subplot(2,3,4)
plot(yArrayControl(:,4))
subplot(2,3,5)
plot(yArrayControl(:,5))

figure()
subplot(2,1,1)
plot(uArrayControl(:,1)*100/255)
title('PWM Duty Cycle Peltier Cell 1')
xlabel('Time (s)')
ylabel('Duty Cycle (%)')
subplot(2,1,2)
plot(uArrayControl(:,2)*100/255)
title('PWM Duty Cycle Peltier Cell 2')
xlabel('Time (s)')
ylabel('Duty Cycle (%)')



% section=200;
% tempNoiseData=y(section:end);
% uNoiseData=u(section:end);