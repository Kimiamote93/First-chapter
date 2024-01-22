clc
clear all

% load oxygen_Ward_Hunt_8.50m.mat
% DO1_WH = var ;
% date1_WH = date ;
% load oxygen_Ward_Hunt_9.30m.mat
% DO2_WH = var ;
% date2_WH = date ;
% load oxygen_WardHunt_7.2m.mat
% DO3_WH = var ;
% date3_WH = date ;
% load 1oxygen_WardHunt_7.2m.mat
% DO4_WH = var ;
% date4_WH = date ;
% 
% DO_WH = [DO1_WH ; DO2_WH ; DO3_WH ; DO4_WH];
% y = [datenum(date1_WH) ; datenum(date2_WH) ; datenum(date3_WH) ; datenum(date4_WH)];
% date_WH = datetime (y,'ConvertFrom', 'datenum', 'Format', 'dd-MM-yyyy');
% FinalDO_bottom_WH = timetable(date_WH, DO_WH);

% load oxygen_bylot_bottom.mat
% DO1_byl = var3 ;
% date1_byl = date2 ;
% load 1oxygen_bylot_8.5m.mat
% DO2_byl = var ;
% date2_byl = date ;
% load oxygen_bylot_8.5m.mat
% DO3_byl = var ;
% date3_byl = date ;
% 
% DO_byl = [DO1_byl ; DO2_byl ; DO3_byl];
% y2 = [datenum(date1_byl) ; datenum(date2_byl) ; datenum(date3_byl)];
% date_byl = datetime (y2,'ConvertFrom', 'datenum', 'Format', 'dd-MM-yyyy');
% FinalDO_bottom_byl = timetable(date_byl, DO_byl);



% load oxygen_boniface_10.0m.mat
% date_boniface = datetime (datenum(date),'ConvertFrom', 'datenum', 'Format', 'dd-MM-yyyy');
% FinalDO_bottom_Boniface = timetable(date_boniface, var);

% load oxygen_Tantare_Basin3_21.0m.mat
% date_TAN3 = datetime (datenum(date),'ConvertFrom', 'datenum', 'Format', 'dd-MM-yyyy');
% FinalDO_bottom_TAN3 = timetable(date_TAN3, var);


% load oxygen_Tantare_Basin4_14.0m.mat
% date_TAN4 = datetime (datenum(date),'ConvertFrom', 'datenum', 'Format', 'dd-MM-yyyy');
% FinalDO_bottom_TAN4 = timetable(date_TAN4, var);

load FinalDO_bottom_WH.mat

DO_bot_WH = timetable2table(FinalDO_bottom_WH) ;
DO = table2array(DO_bot_WH(:,2));
date_bot_WH = table2array(DO_bot_WH(:,1));
day_WH = day (date_bot_WH) ;
month_WH = month (date_bot_WH) ;
dnew = datetime(2000*ones(size(date_bot_WH)), month_WH, day_WH);
dnew2 = datenum (dnew);
[curve, goodness, output] = fit(dnew2,DO,'smoothingspline');
hl = plot(curve, dnew2,DO);
set(hl(2),'Linestyle','-','LineWidth', 3, 'Color', 'b');
set(hl(1), 'MarkerEdgeColor', [0.6000 ,   0.7098   , 0.7804], 'MarkerFaceColor', 'w');

%%%%%%%%%%%%%%%%%%   check the plot %%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Get unique dates
% uniqueDates = unique(dnew2);
% 
% % Initialize arrays to store the averaged values
% averagedDates = zeros(size(uniqueDates));
% averagedOxygen = zeros(size(uniqueDates));
% 
% % Loop over the unique dates and calculate the average for each day
% for i = 1:length(uniqueDates)
%     % Find the indices of the current date
%     indices = find(dnew2 == uniqueDates(i));
%     
%     % Get the corresponding oxygen values
%     oxygenValues = DO(indices);
%     
%     % Calculate the average
%     averagedDates(i) = uniqueDates(i);
%     averagedOxygen(i) = mean(oxygenValues);
% end
% 
% % % Convert the averaged dates back to a date string format
% % averagedDatesStr = datestr(averagedDates, 'mmdd');
% % 
% % % Display the averaged data
% % averagedDO = [averagedDatesStr, num2str(averagedOxygen)];
% % disp(averagedDO);
% 
% % hold on
% % plot (uniqueDates,averagedOxygen,'p')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
hold on

load FinalDO_bottom_byl.mat

% DO_bot_byl = timetable2table(FinalDO_bottom_byl) ;
DO_bot_byl = timetable2table(FinalDO_bottom_byl(361:end,:)) ;
DO2 = table2array(DO_bot_byl(:,2));
date_bot_byl = table2array(DO_bot_byl(:,1));
day_byl = day (date_bot_byl) ;
month_byl = month (date_bot_byl) ;
dnew_byl = datetime(2000*ones(size(date_bot_byl)), month_byl, day_byl);
dnew2_byl = datenum (dnew_byl);
[curve, goodness, output] = fit(dnew2_byl,DO2,'smoothingspline');
ml = plot(curve, dnew2_byl,DO2);
set(ml(2),'Linestyle','-','LineWidth', 3, 'Color', 'r');
set(ml(1), 'MarkerEdgeColor', [1.0000 ,   0.5412  ,  0.5412], 'MarkerFaceColor', 'w');

hold on

load FinalDO_bottom_Boniface.mat

DO_bot_boniface = timetable2table(FinalDO_bottom_Boniface) ;
DO3 = table2array(DO_bot_boniface(:,2));
date_bot_boniface = table2array(DO_bot_boniface(:,1));
day_boniface = day (date_bot_boniface) ;
month_boniface = month (date_bot_boniface) ;
dnew_boniface = datetime(2000*ones(size(date_bot_boniface)), month_boniface, day_boniface);
dnew2_boniface = datenum (dnew_boniface);
[curve, goodness, output] = fit(dnew2_boniface,DO3,'smoothingspline');
nl = plot(curve, dnew2_boniface,DO3);
set(nl(2),'Linestyle','-','LineWidth', 3, 'Color', [0.4940 0.1840 0.5560]);
set(nl(1), 'MarkerEdgeColor',[0.7765  ,  0.6627 ,   0.8000], 'MarkerFaceColor','w');

hold on

load FinalDO_bottom_TAN3.mat

DO_bot_tan3 = timetable2table(FinalDO_bottom_TAN3) ;
DO4 = table2array(DO_bot_tan3(:,2));
date_bot_tan3 = table2array(DO_bot_tan3(:,1));
day_tan3 = day (date_bot_tan3) ;
month_tan3 = month (date_bot_tan3) ;
dnew_tan3 = datetime(2000*ones(size(date_bot_tan3)), month_tan3, day_tan3);
dnew2_tan3 = datenum (dnew_tan3);
[curve, goodness, output] = fit(dnew2_tan3,DO4,'smoothingspline');
ol = plot(curve, dnew2_tan3,DO4)

set(ol(2),'Linestyle','-','LineWidth', 3, 'Color', [62 150 81]./255);
set(ol(1), 'MarkerEdgeColor', [0.6353  ,  0.7098  ,  0.5412], 'MarkerFaceColor', 'w');
% brighten(ol(2),.5);


% load FinalDO_bottom_TAN4.mat

xlabel('Date','FontSize',24,'FontName','Arial','FontWeight','bold')
ax = gca(); 
ax.XTick = linspace(ax.XTick(1),ax.XTick(end),16); 
datetick('x','mmm','keepticks')

lgd = legend('','Ward Hunt','', 'Bylot','','Boniface','','Tantare');


box on
grid on
lgd.FontSize = 18;
lgd.FontName = 'Arial';

ax = gca;
ax.FontSize = 24; 
ax.FontName = 'Arial' ;
% title('Oxygen concentration at the bottom of the lake','FontSize',21,'FontName','Arial','FontWeight','bold')
h_label = ylabel('DO (mg/L)','visible','on','FontSize',24,'FontName','Arial','FontWeight','bold');
xlabel('Month','FontSize',24,'FontName','Arial','FontWeight','bold')
set(gca,'linewidth',2) 
xlim([730476 730861])
ylim([0 18])