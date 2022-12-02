% === DO, PAR and temperature figure ===
% by Kimia Motevalli, 2022
%%
function myplot (s_x,s_y, b_x, b_y, variable, filloutlier, s_depth, b_depth, lake)


xData = datenum(s_x) ;

if filloutlier == "yes"
    y1 = filloutliers(s_y,"clip", "mean");
else 
    y1 = s_y;
end

plot(xData,y1,'r','LineWidth',2)
a = gca;
set(a,'box','on')
hold on

xData = datenum(b_x) ;

if filloutlier == "yes"
    y2 = filloutliers(b_y,"clip", "mean");
else 
    y2 = b_y;
end

plot(xData,y2,'b','LineWidth',2)
box on
datetick('x','dd-mmm-yyyy','keepticks')
grid on

xlabel('Date','FontSize',12,'FontName','Times New Roman','FontWeight','bold')

if variable == "oxygen"
    
    h_label = ylabel('mg/l','visible','on','FontSize',12,'FontName','Times New Roman','FontWeight','bold');
    legend1 = sprintf('DO at %1.1fm', s_depth);
    legend2 = sprintf('DO at %1.1fm');
    legend(legend1, legend2);
%     font_med_PPNW = 14;
%     set(legend,'fontsize',font_med_PPNW)
    title('Oxygen concentration','FontSize',12,'FontName','Times New Roman','FontWeight','bold')
end

if variable == "par"
    
    h_label = ylabel('umol/(s m^2)','visible','on','FontSize',12,'FontName','Times New Roman','FontWeight','bold');
    legend1 = sprintf('PAR at %1.1fm');
    legend2 = sprintf('PAR at %1.1fm', b_depth);
    legend(legend1, legend2);
%     font_med_PPNW = 14;
%     set(legend,'fontsize',font_med_PPNW)
    title('Photosynthetically Active Radiation (PAR)','FontSize',12,'FontName','Times New Roman','FontWeight','bold')
end

hold off