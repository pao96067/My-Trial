% download the data from
% https://gce-lter.marsci.uga.edu/public/app/send_file.asp?accession=PHY-GCEM-1907a&filename=PHY-GCEM-1907a_1_0_VARS.MAT
% Import the data
load('PHY-GCEM-1907a_1_0_VARS.MAT')

% Combine the Year, Month, Day, Hour, Minute variables into a single variable
New_Date = datetime(Year, Month, Day, Hour, Minute, 0);

% Extract the Water Temperature data as Temperature
%Temperature = ; % Replace YourDataVariableName with the actual variable name

% Create an index to filter out NaN values
validIndices = ~isnan(Temperature);

% Filter out NaN values from New_Date and Temperature
New_Date = New_Date(validIndices);
Temperature = Temperature(validIndices);

% Visualize the data
figure
plot(New_Date, Temperature)
title('Water Temperature (^oC) against Time')
xlabel('Date and Time')
ylabel('Temperature (^oC)')
grid on
