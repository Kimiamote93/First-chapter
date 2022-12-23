clc
clear all

%%
%============================ Ward Hunt ==================================
%============================  Bottom   ==================================
% Reading PAR textfile of Ward Hunt and getting the average


TextFile = 'Input\Ward Hunt\Mooring 2019 Ward Hunt\PAR\PAR bottom_2019\PAR bottom_2019_07191026.txt';

T =  readtable (TextFile) ;
V2 = table2array(T(:,2)) ;
x3 = table2array(T(:,5)) ;

i = 1;
j = 1;
    
while i<= length (V2)
     
    F{1,j} = find (strcmpi(V2,V2(i,1)));                              % Find all temperature measured in a day.
    nstart = find (strcmpi(V2,V2(i,1)),1,'last');                             
    i=1+nstart;
    j=j+1;
    
end



for i = 1 : length (F)
    for j = 1 : length (F{1,i})
        vp = (F{1,i}(j,1));
        Finalp{1,i}{j,1} = x3(vp,1);
    end
end


for i = 1:length (F)
    for j = 1 : length (F{1,i})
       P (j,i) =  Finalp{1,i}(j,1);  
    end       
end


e = ~cellfun(@isempty,P);
result = zeros(size(P));
result(e) = cellfun(@(x)mean(x(:,1)),P(e));


var = (sum(result,1) ./ sum(result~=0,1))'; 
variable = 'PAR' ; 
lake = 'Ward Hunt';
depth = 'bottom' ;
date = unique (V2) ;

filename = sprintf('%s_%s_%s.mat', variable, lake, depth);
save(filename, 'var','date'); 



%============================  Top   ==================================
TextFile2 = 'Input\Ward Hunt\Mooring 2019 Ward Hunt\PAR\PAR Top_2019\PAR Top_2019_07190856.txt';

T2 =  readtable (TextFile2) ;
V3 = table2array(T2(:,2)) ;
x4 = table2array(T2(:,5)) ;

i = 1;
j = 1;
    
while i<= length (V3)
     
    F2{1,j} = find (strcmpi(V3,V3(i,1)));                              % Find all temperature measured in a day.
    nstart = find (strcmpi(V3,V3(i,1)),1,'last');                             
    i=1+nstart;
    j=j+1;
    
end



for i = 1 : length (F2)
    for j = 1 : length (F2{1,i})
        vp2 = (F2{1,i}(j,1));
        Finalp2{1,i}{j,1} = x4(vp2,1);
    end
end


for i = 1:length (F2)
    for j = 1 : length (F2{1,i})
       P2 (j,i) =  Finalp2{1,i}(j,1);  
    end       
end


e2 = ~cellfun(@isempty,P2);
result = zeros(size(P2));
result(e2) = cellfun(@(x)mean(x(:,1)),P2(e2));


var2 = (sum(result,1) ./ sum(result~=0,1))'; 
depth2 = 'top' ;
date2 = unique (V3) ;

filename = sprintf('%s_%s_%s.mat', variable, lake, depth2);
save(filename, 'var2','date2'); 

