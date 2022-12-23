clc
clear all

load oxygen_Ward_Hunt_0.75m.mat
s_x = date;
s_y = var;
xData = datenum(s_x) ;


plot(xData,s_y,'r','LineWidth',2)
a = gca;
set(a,'box','on')
hold on


load oxygen_Ward_Hunt_3.36m.mat
m_x = date;
m_y = var;

xData = datenum(m_x) ;

plot(xData,m_y,'c','LineWidth',2)

hold on

load oxygen_Ward_Hunt_7.25m.mat
b_x = date;
b_y = var;

xData = datenum(b_x) ;

plot(xData,b_y,'b','LineWidth',2)
hold on
load oxygen_Ward_Hunt_0.75m2.mat
t_x = date;
t_y = var;
xData = datenum(t_x) ;
plot(xData,t_y,'r','LineWidth',2)
hold on

load oxygen_Ward_Hunt_3.36m2.mat
p_x = date;
p_y = var;
xData = datenum(p_x) ;
plot(xData,p_y,'c','LineWidth',2)

hold on

load oxygen_Ward_Hunt_7.25m2.mat
c_x = date;
c_y = var;
xData = datenum(c_x) ;
plot(xData,c_y,'b','LineWidth',2)

box on
datetick('x','dd-mmm-yyyy','keepticks')
grid on

xlabel('Date','FontSize',12,'FontName','Times New Roman','FontWeight','bold')

    h_label = ylabel('mg/l','visible','on','FontSize',12,'FontName','Times New Roman','FontWeight','bold');
    legend1 = sprintf('DO at 0.75m');
    legend2 = sprintf('DO at 3.36m');
    legend3 = sprintf('DO at 7.25m');
    legend(legend1, legend2,legend3);
%     font_med_PPNW = 14;
%     set(legend,'fontsize',font_med_PPNW)
    title('Oxygen concentration','FontSize',12,'FontName','Times New Roman','FontWeight','bold')
