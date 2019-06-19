testGrid = loadcase('../data/case_ieee123');
testGrid = addGenerators(testGrid, [27 30]);

load '../data/historicalPowerDemands.mat'
powerDemand = historicalPowerDemands(:,1);
powerGeneration = [0.5 0.9];

[voltages, substationPower] = pfsolution(testGrid, powerDemand, powerGeneration);

disp([(1:56)', voltages]);
disp(substationPower);
disp(sum(powerDemand)-sum(powerGeneration));