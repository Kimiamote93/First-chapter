% === Extracting daily average temperature of HOBO sensors ===
% by Kimia Motevalli, 2022
%%
function [temp,date] = temperature(filename, nstart, lake, depth,sensor)   

% Inputs (to function):
%       filename     : The Excel file of HOBO sensor data
%       nstart      : The number of lines that should be discarded from the
%                     Excel file
%       lake      : Name of the lake
%       depth      : The depth at which the sensor is positioned
%       sensor      : hobo or vemco

% Outputs:
%       temp      : Daily temperature
%       date      : Time domain

[num , txt, num] = xlsread (filename);

for i=1:length (num) - nstart
    
Datetime{i,1} = num {i+ nstart,1};

end

if (sensor == "hobo")
    for i=1:length (num) - nstart
    
    Tempp{i,1} = num {i+ nstart,2};

    end
    
else
    
    for i=1:length (num) - nstart
    
    Tempp{i,1} = num {i+ nstart,3};

      end
end

    


Temp = cell2mat (Tempp);

splitcells = regexp(Datetime, '\s+','split');

for i = 1 : length (num)-nstart
    date1 {i,1} = splitcells {i,1}{1,1};
end
    
    i = 1;
    j = 1;
    
while i<=length (num)-nstart
     
    FTemp{1,j} = find (strcmpi(date1,date1{i,1}));                              % Find all temperature measured in a day.
    t = find (strcmpi(date1,date1{i,1}),1,'last');                             
    i=1+t;
    j=j+1;
    
end



for i = 1 : length (FTemp)
    for j = 1 : length (FTemp{1,i})
        u = (FTemp{1,i}(j,1));
        FTemperature{1,i}{j,1} = Temp(u,1);
        
    end
    
end


for i = 1:length (FTemp)
    for j = 1 : length (FTemp{1,i})
       FinalTemp (j,i) =  FTemperature{1,i}(j,1);  
    end       
end


e = ~cellfun(@isempty,FinalTemp);
result = zeros(size(FinalTemp));
result(e) = cellfun(@(x)mean(x(:,1)),FinalTemp(e));


temp = (sum(result,1) ./ sum(result~=0,1))';
date = (unique(date1(:).'))';


filename = sprintf('temperature_%s_%s_%dm.mat', sensor, lake, depth);
save(filename, 'temp','date'); 