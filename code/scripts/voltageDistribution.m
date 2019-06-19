testGrid = loadcase('../data/case_ieee123');

genBuses = [20];
testGrid = addGenerators(testGrid, genBuses);
powerGeneration = 0;

load '../data/historicalPowerDemands.mat'
numberOfDataPoints = size(historicalPowerDemands,2);

voltages = zeros(size(testGrid.bus,1), numberOfDataPoints);

for dataPoint = 1:numberOfDataPoints

    voltages(:,dataPoint) = pfsolution(testGrid, historicalPowerDemands(:,dataPoint), powerGeneration);
    fprintf(1,'\b\b\b\b%03.f%%',dataPoint/numberOfDataPoints*100);
    
end

percentilePlot(voltages);
saveFigure(sprintf('errorbar_voltages_%0.3fMW',powerGeneration));