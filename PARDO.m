% === Extracting daily average oxygen concentration and par values measured by MiniDOT and MiniPAR sensors ===
% by Kimia Motevalli, 2022

function [var,temp,date] = PARDO(variable, directory, nstart, textFiles, lake, depth)   

% Inputs (to function):
%       variable     : The variable should be par or oxygen
%       directory      : The directory of all text files
%       nstart      : The start of reading text files
%       textFiles      : Listing all text files
%       lake      : Name of the lake
%       depth      : The depth at which the sensor is positioned

% Outputs:
%       var      : Daily PAR values or oxygen concentartion
%       temp      : Daily temperature measured by the miniPAR or miniDOT
%                   sensor
%       date      : Time domain


warning off

%============================ MiniPAR ==================================
%%{
if (variable == "par")
    
    numfiles = length(textFiles);
    mydata = cell(1, numfiles);
    path(path,directory);
    
if (lake == "Ward Hunt")
    for k = nstart:numfiles
        
    cd(directory)
    fid = fopen(textFiles(k).name, 'rt') ;
    cd 'C:\MyLake\First Chapter'
    fgets(fid) ;                                              % Read/discard line.
    buffer = fread(fid, Inf) ;                                % Read rest of the file.
    fclose(fid);
    fid = fopen(textFiles(k).name, 'w')  ;                    % Open destination file.
    fwrite(fid, buffer) ;                                     % Save to file.
    fclose(fid) ;
    
    %Put a comma after PAR in order to be seperated
    R = regexp( fileread(textFiles(k).name), '\n', 'split');
    R{2} = sprintf('%s',"Time (sec),  Bat (Volts),   T (deg C),  PAR (umol/(s m^2)),  Ax (g), Ay (g), Az (g)");
    fid = fopen(textFiles(k).name, 'w');
    fprintf(fid, '%s\n', R{:});
    fclose(fid);
    
    
    A = readtable(textFiles(k).name,'Format','%f%f%f%f');   % Read the 4th column.
    B = table2array(A(:,4));                
    
   
   for j = 1: length (B)
       
    x1{1,k}{:,1} = table2array(A(:,1)); 
    x1{1,k}{:,2} = datetime(x1{1,k}{:,1}, 'convertfrom','posixtime') - hours (4);
    x1{1,k}{:,3} = table2array(A(:,3));
    x1{1,k}{:,4} = table2array(A(:,2));
   
   end
   
   end

else
    for k = nstart:numfiles
        
    cd(directory)
    fid = fopen(textFiles(k).name, 'rt') ;
    cd 'C:\MyLake\First Chapter'
    fgets(fid) ;                                              % Read/discard line.
    buffer = fread(fid, Inf) ;                                % Read rest of the file.
    fclose(fid);
    fid = fopen(textFiles(k).name, 'w')  ;                    % Open destination file.
    fwrite(fid, buffer) ;                                     % Save to file.
    fclose(fid) ;
    
    %Put a comma after PAR in order to be seperated
    R = regexp( fileread(textFiles(k).name), '\n', 'split');
    R{2} = sprintf('%s',"Time (sec),  Bat (Volts),   T (deg C),  PAR (umol/(s m^2)),  Ax (g), Ay (g), Az (g)");
    fid = fopen(textFiles(k).name, 'w');
    fprintf(fid, '%s\n', R{:});
    fclose(fid);
    
    
    A = readtable(textFiles(k).name,'Format','%f%f%f%f%f%f%f');   % Read the 4th column.
    B = table2array(A(:,4));                
    
   
   for j = 1: length (B)
       
    x1{1,k}{:,1} = table2array(A(:,1)); 
    x1{1,k}{:,2} = datetime(x1{1,k}{:,1}, 'convertfrom','posixtime') - hours (4);
    x1{1,k}{:,3} = table2array(A(:,4));
    x1{1,k}{:,4} = table2array(A(:,3));
   
   end
   
   end

end


delete('C:\MyLake\First Chapter/*.txt')
  
%

x2=[];
x3=[];
x4=[];

for k = nstart:length(x1)
    x2=[x2;x1{k}{2}];
    x3=[x3;x1{k}{3}];
    x4=[x4;x1{k}{4}];
end

      
    t = datetime(x2);
    vp = datevec(x2);
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
    
filename = sprintf('%s_%s_%.1fm.mat', variable, lake, depth);
save(filename, 'var','date');   


for i = 1 : length (F)
    for j = 1 : length (F{1,i})
        vt = (F{1,i}(j,1));
        Finalt{1,i}{j,1} = x4(vt,1);
    end
end


for i = 1:length (F)
    for j = 1 : length (F{1,i})
       T (j,i) =  Finalt{1,i}(j,1);  
    end       
end


e2 = ~cellfun(@isempty,T);
result2 = zeros(size(T));
result2(e2) = cellfun(@(x)mean(x(:,1)),T(e));


temp = (sum(result2,1) ./ sum(result2~=0,1))';

filename = sprintf('temperature_miniPAR_%s_%.1fm.mat', lake, depth);
save(filename, 'temp','date');

end

%%
%============================ MiniDOT ==================================
%%{
if (variable == "oxygen")

    numfiles = length(textFiles);
    mydata = cell(1, numfiles);
    path(path,directory);
    
if (lake == "Ward Hunt")
    for k = nstart:numfiles
    
    cd(directory)
    fid = fopen(textFiles(k).name, 'rt') ;
    cd 'C:\MyLake\First Chapter'
    fgetl(fid) ;                                              % Read/discard line.
    buffer = fread(fid, Inf) ;                                % Read rest of the file.
    fclose(fid) ;
    fid = fopen(textFiles(k).name, 'w')  ;                    % Open destination file.
    fwrite(fid, buffer) ;                                     % Save to file.
    fclose(fid) ;
    
  
    
    %Put a comma in order to be seperated
    R = regexp( fileread(textFiles(k).name), '\n', 'split');
    R{2} = sprintf('%s',"Time (sec),  T (deg C),  DO (mg/l),  Q ()");
    fid = fopen(textFiles(k).name, 'w');
    fprintf(fid, '%s\n', R{:});
    fclose(fid);
    A = readtable(textFiles(k).name,'Format','%f%f%f%f');   % Read the 4th column.
    B = table2array(A(:,4));                
    
   
   for j = 1: length (B)
       
    x1{1,k}{:,1} = table2array(A(:,1)); 
    x1{1,k}{:,2} = datetime(x1{1,k}{:,1}, 'convertfrom','posixtime') - hours (4);
    x1{1,k}{:,3} = table2array(A(:,4));
    x1{1,k}{:,4} = table2array(A(:,3));
   
   end
   
end
else    
   for k = nstart:numfiles
    
    cd(directory)
    fid = fopen(textFiles(k).name, 'rt') ;
    cd 'C:\MyLake\First Chapter'
    fgetl(fid) ;                                              % Read/discard line.
    buffer = fread(fid, Inf) ;                                % Read rest of the file.
    fclose(fid) ;
    fid = fopen(textFiles(k).name, 'w')  ;                    % Open destination file.
    fwrite(fid, buffer) ;                                     % Save to file.
    fclose(fid) ;
    
    
    A = readtable(textFiles(k).name,'Format','%f%f%f%f%f%f%f');   % Read the 4th column.
    B = table2array(A(:,4));                
    
   
   for j = 1: length (B)
       
    x1{1,k}{:,1} = table2array(A(:,1)); 
    x1{1,k}{:,2} = datetime(x1{1,k}{:,1}, 'convertfrom','posixtime') - hours (4);
    x1{1,k}{:,3} = table2array(A(:,4));
    x1{1,k}{:,4} = table2array(A(:,3));
   
   end
   
end
end



delete('C:\MyLake\First Chapter/*.txt')
  
%

x2=[];
x3=[];
x4=[];

for k = nstart:length(x1)
    x2=[x2;x1{k}{2}];
    x3=[x3;x1{k}{3}];
    x4=[x4;x1{k}{4}];
end

      
    t = datetime(x2);
    vp = datevec(x2);
    Var = datetime(vp(:,1:3));
    Var_2 = duration(vp(:,4:end));
    V2 = cellstr(Var);
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
        Finalo{1,i}{j,1} = x3(vp,1);
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
    
filename = sprintf('%s_%s_%.1fm.mat', variable, lake, depth);
save(filename, 'var','date');   


for i = 1 : length (F)
    for j = 1 : length (F{1,i})
        vt = (F{1,i}(j,1));
        Finalt{1,i}{j,1} = x4(vt,1);
    end
end


for i = 1:length (F)
    for j = 1 : length (F{1,i})
       T (j,i) =  Finalt{1,i}(j,1);  
    end       
end


e2 = ~cellfun(@isempty,T);
result2 = zeros(size(T));
result2(e2) = cellfun(@(x)mean(x(:,1)),T(e));


temp = (sum(result2,1) ./ sum(result2~=0,1))';

filename = sprintf('temperature_miniDOT_%s_%.1fm.mat', lake, depth);
save(filename, 'temp','date'); 

end
