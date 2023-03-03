clc
clear all

load Temp_Oxygen_bot.mat
load Temp_Oxygen_bot2.mat
load Temp_Oxygen_surf.mat
load Temp_PAR_bot.mat
load Temp_PAR_surf.mat

load V1_bot.mat
load V1_bot2.mat
load V1_surf.mat

load V2_bot.mat
load V2_surf.mat


d1 = datetime(V1_bot);
d2 = datetime(V1_bot2);
d3 = datetime(V1_surf);
date_Oxygen_bot = (unique(d1(:).'))';
date_Oxygen_bot2 = (unique(d2(:).'))';
date_Oxygen_surf = (unique(d3(:).'))';


d4 = datetime(V2_bot);
d5 = datetime(V2_surf);
date_PAR_bot = (unique(d4(:).'))';
date_PAR_surf = (unique(d5(:).'))';


%%

path(path,'C:\MyLake\BYLOT measurements\Light-Oxygen\Hobos');
nstart = 4;

[num , txt, num] = xlsread ('Bylot_1.xlsx');
[temp1,date1] = hobotemp (num, txt, nstart);


[num2 , txt2, num2] = xlsread ('Bylot_2.xlsx');
[temp2,date2] = hobotemp (num2, txt2, nstart);


[num3 , txt3, num3] = xlsread ('Bylot_3.xlsx');
[temp3,date3] = hobotemp (num3, txt3, nstart);


[num4 , txt4, num4] = xlsread ('Bylot_4.xlsx');
[temp4,date4] = hobotemp (num4, txt4, nstart);


[num5 , txt5, num5] = xlsread ('Bylot_5.xlsx');
[temp5,date5] = hobotemp (num5, txt5, nstart);


%%
%Figure

figure(1)
hold on

dc = hsv(11); 

y1 = Temp_Oxygen_surf (1,1120:end);
y2 = Temp_PAR_surf(1,10:360);
y3 = temp1' ; 
y4 = temp2' ;
y5 = Temp_PAR_bot(1,10:360) ;
y6 = temp3' ;
y7 =  temp4' ;
y8 = Temp_Oxygen_bot ;
y9 =   temp5';


startDate1 = datenum('07-Aug-2021');                               % X axis                         
endDate1 = datenum('23-July-2022');
xData1 = linspace(startDate1,endDate1,endDate1 - startDate1 +1);

plot(xData1,y1,'color',dc(1,:),'LineWidth',2)
hold on

plot(xData1,y2,'color',dc(2,:),'LineWidth',2)
hold on

plot(xData1,y3,'color',dc(3,:),'LineWidth',2)
hold on

plot(xData1,y4,'color',dc(4,:),'LineWidth',2)
hold on

plot(xData1,y5,'color',dc(6,:),'LineWidth',2)
hold on

plot(xData1,y6,'color',dc(7,:),'LineWidth',2)
hold on

plot(xData1,y7,'color',dc(9,:),'LineWidth',2)
hold on

plot(xData1,y8,'color',dc(10,:),'LineWidth',2)
hold on

plot(xData1,y9,'color',dc(11,:),'LineWidth',2)

sdice = xData1 (1,30);
edice = xData1 (1,320);

box1= [sdice sdice edice edice];
boxy=[-2 15 15 -2];
patch(box1,boxy,[0.220,0.220,0.220] ,'EdgeColor','none', 'FaceAlpha',0.2)

datetick('x','dd-mmm-yyyy','keepticks')

 lgd = legend('1 m','1.5 m','2 m','3 m','3.5 m','4 m', '5 m','7 m' , '8 m','Ice cover period') 
% lgd = legend('1.04 m','1.56 m','2 m','3.06 m','3.56 m','4.08 m', '5.10 m','7.14 m' , '8.16 m') 
v = get(lgd,'title');
set(v,'string','Temperature at:');

xlabel('Date','FontSize',12,'FontName','Times New Roman','FontWeight','bold')
ylabel('Temperature (°C)','FontSize',12,'FontName','Times New Roman','FontWeight','bold')

ylim ([-1 15]);
title('Daily Temperature','FontSize',12,'FontName','Times New Roman','FontWeight','bold')
box on
grid on


hold off

