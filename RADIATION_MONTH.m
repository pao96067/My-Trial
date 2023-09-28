% download the data from
% https://gce-lter.marsci.uga.edu/public/app/send_file.asp?accession=portal&filename=sinerr/2018/data/marshlanding_realtime_jan18-dec18_vars.mat

% import the data
load('marshlanding_realtime_jan18-dec18_vars.mat')

% data of interest: Month (-), Total_Solar_Rad_kW (kW/m2)


% Initialize months vector from 1 to 12
months = 1:12;

% select data from month
for imonth = 1:12
    % select data from month number 'imonth' and filter out NaN
    ind = (Month == imonth) & ~isnan(Total_Solar_Rad_kW);
    % store the total solar rad from those times in vector A
    A = Total_Solar_Rad_kW(ind);
    % compute maximum for each month
    maxTSR(imonth) = max(A);
    % clear the temporary variables A and ind to make sure they are empty at the start of the next loop
    clear A ind
end

% visualize the result with stars as markers
figure
plot(months, maxTSR, 'b*-')
title('Maximum Total Solar Radiation in a Month')
xlabel('Month')
ylabel('Solar Radiation (kW/m^2)')


