% download the data from
% https://gce-lter.marsci.uga.edu/public/app/send_file.asp?accession=portal&filename=sinerr/2018/data/marshlanding_realtime_jan18-dec18_vars.mat

% import the data
load('marshlanding_realtime_jan18-dec18_vars.mat')

% data of interest: Year, Month, Day, Humidity (%)

% Extract the Humidity data
humidity = Humidity;

% Combine the Year, Month, Day variables into a single variable
dates = datetime(Year, Month, Day);

% Visualize the daily humidity data
figure
plot(dates, humidity)
title('Daily Relative Humidity Data')
xlabel('Date')
ylabel('Humidity (%)')
grid on
