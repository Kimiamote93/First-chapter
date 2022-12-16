clc
clear all

%%
%============================ Bylot  ==================================
% Reading Oxygen textfile of Bylot (year 2015-2016) and getting the average
% There are two kinds of miniDOT data for the year 2015-2016

%============================  Top      ==================================

TextFile = 'Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\BYL37fond_MiniDOT_2015-2016.txt';
T =  readtable (TextFile) ;
V2 = table2array(T(:,3)) ;
x2 = table2array(T(:,6)) ;
x4 = table2array(T(:,5)) ;

t = datetime(V2);
vp = datevec(V2);
Var_1 = datetime(vp(:,1:3));
Var_2 = duration(vp(:,4:end));
V2 = cellstr(Var_1);
date = unique(V2, 'stable');

    
    i = 1;
    j = 1;
    
    
while i<= length (x2)
     
    F{1,j} = find (strcmpi(V2,V2{i,1}));                              % Find all temperature measured in a day.
    nstart = find (strcmpi(V2,V2{i,1}),1,'last');                             
    i=1+nstart;
    j=j+1;
    
end


for i = 1 : length (F)
    for j = 1 : length (F{1,i})
        vp = (F{1,i}(j,1));
        Finalo{1,i}{j,1} = x2(vp,1);
    end
end


for i = 1:length (F)
    for j = 1 : length (F{1,i})
       O (j,i) =  Finalo{1,i}(j,1);  
    end       
end


e = ~cellfun(@isempty,O);
result = zeros(size(O));
result(e) = cellfun(@(x)mean(x(:,1)),O(e));


var = (sum(result,1) ./ sum(result~=0,1))';
    

variable = 'oxygen' ; 
lake = 'bylot';
depth = 'top' ;


filename = sprintf('%s_%s_%s.mat', variable, lake, depth);
save(filename, 'var','date');   


for i = 1 : length (F)
    for j = 1 : length (F{1,i})
        vt = (F{1,i}(j,1));
        Finalt{1,i}{j,1} = x4(vt,1);
    end
end


for i = 1:length (F)
    for j = 1 : length (F{1,i})
       TI (j,i) =  Finalt{1,i}(j,1);  
    end       
end


e2 = ~cellfun(@isempty,TI);
result2 = zeros(size(TI));
result2(e2) = cellfun(@(x)mean(x(:,1)),TI(e));


temp = (sum(result2,1) ./ sum(result2~=0,1))';

filename = sprintf('temperature_miniDOT_%s_%s.mat', lake, depth);
save(filename, 'temp','date');


%============================  Bottom    ==================================

TextFile2 = 'Input\New Bylot\Bylot 2016\MiniDOT_BYL37 2015-2016\BYL37surf_MiniDOT_2015-2016.txt';
T2 =  readtable (TextFile2) ;
V3 = table2array(T2(:,3)) ;
x5 = table2array(T2(:,6)) ;
x6 = table2array(T2(:,5)) ;

t2 = datetime(V3);
vp2 = datevec(V3);
Var_3 = datetime(vp2(:,1:3));
Var_4 = duration(vp2(:,4:end));
V3 = cellstr(Var_3);
date2 = unique(V3, 'stable');

    
    i = 1;
    j = 1;
    
    
while i<= length (x5)
     
    F2{1,j} = find (strcmpi(V3,V3{i,1}));                              % Find all temperature measured in a day.
    nstart2 = find (strcmpi(V3,V3{i,1}),1,'last');                             
    i=1+nstart2;
    j=j+1;
    
end


for i = 1 : length (F2)
    for j = 1 : length (F2{1,i})
        vp2 = (F2{1,i}(j,1));
        Finalo2{1,i}{j,1} = x5(vp2,1);
    end
end


for i = 1:length (F2)
    for j = 1 : length (F2{1,i})
       O2 (j,i) =  Finalo2{1,i}(j,1);  
    end       
end


e3 = ~cellfun(@isempty,O2);
result = zeros(size(O2));
result(e3) = cellfun(@(x)mean(x(:,1)),O2(e3));


var3 = (sum(result,1) ./ sum(result~=0,1))';
    


depth2 = 'bottom' ;


filename = sprintf('%s_%s_%s.mat', variable, lake, depth2);
save(filename, 'var3','date2');   


for i = 1 : length (F2)
    for j = 1 : length (F2{1,i})
        vt = (F2{1,i}(j,1));
        Finalt2{1,i}{j,1} = x6(vt,1);
    end
end


for i = 1:length (F2)
    for j = 1 : length (F2{1,i})
       TI2 (j,i) =  Finalt2{1,i}(j,1);  
    end       
end


e2 = ~cellfun(@isempty,TI2);
result2 = zeros(size(TI2));
result2(e2) = cellfun(@(x)mean(x(:,1)),TI2(e3));


temp2 = (sum(result2,1) ./ sum(result2~=0,1))';

filename = sprintf('temperature_miniDOT_%s_%s.mat', lake, depth2);
save(filename, 'temp2','date2');

