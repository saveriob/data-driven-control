function [voltages, substationPower] = pfsolution(testGrid, powerDemand, powerGeneration);

define_constants;

if ~isvector(powerDemand)
    error('Power demand is not a vector');
end

if ~isvector(powerGeneration)
    error('Power generation is not a vector');
end

if length(powerDemand) ~= (size(testGrid.bus,1)-1)
    error('Number of load buses different from number of demands');
end

if length(powerGeneration) ~= (size(testGrid.gen,1)-1)
    error('Number of generators different from number of generation setpoints');
end

testGrid.bus(1:end-1,PD) = powerDemand(:);
testGrid.bus(1:end-1,QD) = 0;

testGrid.gen(1:end-1,PG) = powerGeneration(:);
testGrid.gen(1:end-1,QG) = 0;

pfresult = runpf(testGrid, mpoption('VERBOSE', 0, 'OUT_ALL',0));

voltages = pfresult.bus(:,VM);
substationPower = pfresult.gen(end,PG);
