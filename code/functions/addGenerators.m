function mpc = addGenerators(mpc, generatorBuses)

% Adds generators to the MATPOWER testcases.
% Generators are listed before the existing ones.
% Zero power limits are set (only used in OPF).

define_constants;

if any(~ismember(generatorBuses,mpc.bus(:, BUS_I)))
    error('You are trying to place generators in a non-existing bus.');
end
    
newGenLines = [generatorBuses(:), repmat([0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0], length(generatorBuses),1)];
newGencostLines = repmat([2 0 0 2 0 0],length(generatorBuses),1);

mpc.gen = [newGenLines; mpc.gen];
mpc.gencost = [newGencostLines; mpc.gencost];

