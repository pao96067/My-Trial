% Import the data
load("marshlanding_realtime_jan20-dec20_vars.mat")

% Identify data variables of interest: Month (-), Temp_Air (^oC)

% Initialize arrays to store monthly means and standard deviations
monthlyMean = zeros(1, 12);
monthlyStd = zeros(1, 12);

% Select data from each month and calculate mean and standard deviation
for imonth = 1:12
    % Select data for the current month and filter out NaN
    ind = (Month == imonth) & ~isnan(Temp_Air);
    
    % Store the air temperatures from those times in vector V
    V = Temp_Air(ind);
    
    % Compute mean and standard deviation for each month
    monthlyMean(imonth) = mean(V);
    monthlyStd(imonth) = std(V);
    
    % Clear the temporary variable V and ind to make sure they are empty at the start of the next loop
    clear V ind
end

% Visualize the result with error bars and stars
figure
errorbar(1:12, monthlyMean, monthlyStd, 'o-', 'LineWidth', 0.5, 'MarkerSize', 2)
hold on
plot(1:12, monthlyMean, 'r*') % Add red stars
hold off
title('Mean Air Temperature in a Month with Standard Deviation (^oC)')
xlabel('Month')
ylabel('Temperature (^oC)')
grid on
