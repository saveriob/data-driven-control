testGrid = loadcase('../data/case_ieee123');

genBuses = [27 30];
testGrid = addGenerators(testGrid, genBuses);

load '../data/historicalPowerDemands.mat'
powerDemand = historicalPowerDemands(:,1);
powerGeneration = [0.5; 0.9];

[voltages, substationPower] = pfsolution(testGrid, powerDemand, powerGeneration);

R = sensitivityMatrix(testGrid);

powerInjections = -powerDemand;
powerInjections(genBuses) = powerInjections(genBuses) + powerGeneration;
approximateLoadVoltages = 1 + R * powerInjections;

plot(1:55, voltages(1:end-1), 'ko ', 1:55, approximateLoadVoltages, 'k* ');
xlabel('load bus index');
ylabel('voltage [pu]');
saveFigure('linearizationAccuracy');