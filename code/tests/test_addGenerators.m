define_constants;
testGrid = loadcase('../data/case_ieee123');

newTestGrid = addGenerators(testGrid, [1 3 4]);
disp(newTestGrid.gen(:,GEN_BUS));

newTestGrid = addGenerators(testGrid, [1; 3; 4]);
disp(newTestGrid.gen(:,GEN_BUS));

try
    newTestGrid = addGenerators(testGrid, [1; 3; 400]);
catch ME
    warning(ME.message);
end