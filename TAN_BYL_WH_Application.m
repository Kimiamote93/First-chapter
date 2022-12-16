 clc
clear all

%%
%============================ Bylot ==================================


lake = 'bylot';

%%MiniDOT sensor

2016
variable = 'oxygen';            %The variable should be 'par' or 'oxygen'
depth = 1.5 ;            %The depth at which the sensor is positioned
textFiles = dir ('Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\7392-041680\*.txt')   ;            % Listing all text files
directory = 'Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\7392-041680';The directory of all text files
nstart = 3;
[var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 8.5;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\7392-405179\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\7392-405179';
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% % 2019
% depth = 1.5 ;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2019\Mouillage 2019\MiniDot_Top\7450-070130\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2019\Mouillage 2019\MiniDot_Top\7450-070130';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 8.5;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2019\Mouillage 2019\MiniDot_bottom\7450-110096\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2019\Mouillage 2019\MiniDot_bottom\7450-110096';
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% 
% %2021
% depth = 1.5 ;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniDOTs\7450-070130\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniDOTs\7450-070130';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 8.5;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniDOTs\7450-966591\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniDOTs\7450-966591';
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% %%MiniPAR sensor
% 
% variable = 'par';
% depth = 1.5;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniPARs\7530-118656\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniPARs\7530-118656';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 7;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniPARs\7530-060264\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\MiniPARs\7530-060264';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% %%Temperature
% %Vemco
% %2016
% sensor = 'vemco';
% nstart = 8;
% depth = 1; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\Vemco_BYL37 2015-2016\Minilog-II-T_350160_20160712_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% depth = 3; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\Vemco_BYL37 2015-2016\Minilog-II-T_350158_20160712_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 5; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\Vemco_BYL37 2015-2016\Minilog-II-T_350156_20160712_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 7; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\Vemco_BYL37 2015-2016\Minilog-II-T_350136_20160712_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 9; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2016\Vemco_BYL37 2015-2016\Minilog-II-T_350139_20160712_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% %2018
% depth = 1; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2018\Minilog-II-T_350160_20180710_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% depth = 3; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2018\Minilog-II-T_350158_20180710_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 5; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2018\Minilog-II-T_350156_20180710_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 7; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2018\Minilog-II-T_350136_20180710_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% 
% depth = 9; 
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2018\Minilog-II-T_350139_20180710_1.csv' ;
% [temp,date] = temperature (filename, nstart, lake, depth,sensor)  ; 
% 
% %Hobo
% %2021
% 
% sensor = 'hobo';
% depth = 1; 
% nstart = 5;
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\Hobos\Bylot_1.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth, sensor)  ; 
% 
% depth = 2;  
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\Hobos\Bylot_2.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth, sensor)  ; 
% 
% depth = 3;  
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\Hobos\Bylot_3.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth, sensor)  ; 
% 
% depth = 4;  
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\Hobos\Bylot_4.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth, sensor)  ; 
% 
% depth = 5;  
% filename = 'C:\MyLake\First Chapter\Input\New Bylot\Bylot 2021\Hobos\Bylot_5.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth, sensor)  ; 
% 
% %============================ Tantare ==================================
% %%
% %MiniPAR sensor
% %Basin 4 
% lake = 'Tantare_Basin4';
% variable = 'par';
% depth = 1;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniPAR_1m_345582\7530-345582\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniPAR_1m_345582\7530-345582';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 10;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniPAR_10m_435024\7530-435024\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniPAR_10m_435024\7530-435024';
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% %Basin 3
% lake = 'Tantare_Basin3';
% variable = 'par';
% depth = 1.5;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniPAR_1.5m_339428\7530-339428\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniPAR_1.5m_339428\7530-339428';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 7;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniPAR_7m_639659\7530-639659\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniPAR_7m_639659\7530-639659';
% nstart = 3;
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% %MiniDOT sensor
% %Basin 4 
% lake = 'Tantare_Basin4';
% variable = 'oxygen';
% depth = 2;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 14;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_14m_020463\7450-020463\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_14m_020463\7450-020463';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_14m_020463\7450-020463'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% 
% %Basin 3
% lake = 'Tantare_Basin3';
% variable = 'oxygen';
% depth = 1;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniDOT_1m_108904\7450-108904\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniDOT_1m_108904\7450-108904';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 21;
% textFiles = dir ('C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniDOT_21m_147565\7450-147565\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniDOT_21m_147565\7450-147565';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_14m_020463\7450-020463'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% %HOBO logger
% 
% lake = 'Tantare_Basin4';
% 
% depth = 4; 
% nstart = 4;
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\HOBO_4M_20880725\TAN_A_4m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% depth = 7; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\HOBO_7m_20880726\TAN_A_7m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% lake = 'Tantare_Basin3';
% 
% depth = 4; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniHOBO_4m_20880728\TAN_B_4m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% depth = 10; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniHOBO_10m_20880732\TAN_B_10m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% depth = 14; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniHOBO_14m_20880733\TAN_B_14m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% depth = 16; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniHOBO_16m_20880734\TAN_B_16m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% 
% depth = 19; 
% filename = 'C:\MyLake\First Chapter\Input\New Tantare\tantere_bassin3_20210519\miniHOBO_19m_20880735\TAN_B_19m.xlsx' ;
% [temp,date] = temperature (filename, nstart, lake, depth)  ; 
% 
% 
% 
% 
% 


%============================ Ward Hunt ==================================
%%
%%MiniDOT 2019
lake = 'Ward Hunt';
variable = 'oxygen';
depth = 0.75;
textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Top\*.txt')   ; 
directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Top';
nstart = 3;
% cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% cd 'C:\MyLake\First Chapter'
[var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;

% depth = 3.36;
% textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Mid\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Mid';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 7.25;
% textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Bottom\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mooring 2019 Ward Hunt\MinoDot\Bottom';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;

%MiniDOT 2022
% lake = 'Ward Hunt';
% variable = 'oxygen';
% depth = 0.75;
% textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Top\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Top';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 3.36;
% textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Middle\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Middle';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;
% 
% depth = 7.25;
% textFiles = dir ('C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Bottom\*.txt')   ; 
% directory = 'C:\MyLake\First Chapter\Input\Ward Hunt\Mouillage Ward Hunt 2022\miniDOT\Bottom';
% nstart = 3;
% % cd 'C:\MyLake\First Chapter\Input\New Tantare\tantare_bassin4_20210519\miniDOT_2m_122660\7450-122660'
% % cd 'C:\MyLake\First Chapter'
% [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)    ;