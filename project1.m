% Heart Rate Monitor Project
%Insert data
% Heart Rate mesurements (BPM)
%heartRate=[72 74 76 77 76 79 81 80 78 76];
% Statistics - measurements
data=readtable('heartRateData.csv');
minute=data.Minute;
heartRate=data.HeartRate;
averageHeartRate = mean(heartRate);
maximumHeartRate= max(heartRate);
minimumHeartRate = min(heartRate);
standardDeviation=std(heartRate);
if standardDeviation>3
    disp('Heart Rate variability: High')
else
    disp('Heart Rate variability: Normal')
end


% Logical Indexing
% Find Heart Rates 
highHeartRates=heartRate(heartRate>78);
lowHeartRates=heartRate(heartRate<75);
normalHeartRates=heartRate(heartRate>=75 & heartRate<=78);
% Count how many measurements are above 78 BPM
numberofHighRates=length(highHeartRates);
numberofLowRates=length(lowHeartRates);
numberofNormalRates=length(normalHeartRates);

% Indices above 78
highIndices=find(heartRate>78);
lowIndices=find(heartRate<75);
normalIndices=find(heartRate>=75 & heartRate<=78);

% minute of maximum heart rate
% Find the minute of maximum heart rate
maximumHeartRateIndex=find(heartRate==maximumHeartRate);
maximumHeartRateminute=minute(maximumHeartRateIndex);
% Warning
if maximumHeartRate>80
    disp('High Heart Rate Event Detected')
else
    disp('Heart Rate is Normal')
end

% Emfanisi apotelesmatwn
fprintf('Average Heart Rate: %.1f\n', averageHeartRate)
fprintf('Maximum Heart Rate: %.1f\n', maximumHeartRate)
fprintf('Minimum Heart Rate: %.1f\n', minimumHeartRate)
fprintf('Standard Deviation:%.2f bpm\n',standardDeviation)

%Grafima
x=1:10;
y=heartRate;
plot(x,y,'-k','LineWidth',2)
hold on;
plot(highIndices,highHeartRates,'ro','MarkerSize',10)
plot (lowIndices,lowHeartRates,'go','Markersize',10)
plot(normalIndices,normalHeartRates,'bo', 'Markersize',10)
hold off
grid on;
xlabel('Time (minutes)')
ylabel('Heart Rate (BPM)')
title('Patient Heart Rate Over Time');
legend('Heart Rate','High','Low','Normal')

highCounter=0;
for i=1:length(heartRate)
    if heartRate(i)>80
        highCounter=highCounter+1;
    fprintf('High Heart Rate detected at minute:%d:%.0f BPM\n', minute(i),heartRate(i))
    end
end
fprintf('\n');
fprintf('Total High Heart Rate Events:%d\n',highCounter);
if highCounter==0
    disp('Patient Status: Normal')
else
    disp('Patient Status:Attention Required')
end



