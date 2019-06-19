load '../data/historicalPowerDemands.mat'
numberOfDataPoints = size(historicalPowerDemands,2);

figure(1)
subplot(1,3,1)
    histogram(historicalPowerDemands(1,:), 'Normalization', 'pdf')
subplot(1,3,2)
    histogram(historicalPowerDemands(2,:), 'Normalization', 'pdf')
subplot(1,3,3)
    histogram(historicalPowerDemands(3,:), 'Normalization', 'pdf')
saveFigure('powerDemandDistribution');

figure(2)    
    aggregatedPowerDemand = sum(historicalPowerDemands);
    histogram(sum(historicalPowerDemands), 'Normalization', 'pdf');
    hold on
    xaxRange = max(aggregatedPowerDemand)-min(aggregatedPowerDemand);
    xax = (min(aggregatedPowerDemand)-0.5*xaxRange):(0.01*xaxRange):(max(aggregatedPowerDemand)+0.1*xaxRange); 
    plot(xax, normpdf(xax, mean(aggregatedPowerDemand), std(aggregatedPowerDemand)));
saveFigure('aggregatedPowerDemandDistribution');