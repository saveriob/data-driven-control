warning('off','MATLAB:nchoosek:LargeCoefficient')

disp('As a function of n')
epsilon = 0.05;
beta = 1e-3;
for n = [1 10 100]
    disp(sprintf('n = %3.0d, N = %d', [n numberOfScenarios(n, epsilon, beta)]));
end

disp('As a function of epsilon')
n = 3;
beta = 1e-3;
for epsilon = [1e-1 1e-2 1e-3]
    disp(sprintf('epsilon = %e, N = %d', [epsilon numberOfScenarios(n, epsilon, beta)]));
end

disp('As a function of beta')
n = 3;
epsilon = 0.05;
for beta = [1e-2 1e-3 1e-4 1e-5]
    disp(sprintf('beta = %e, N = %d', [beta numberOfScenarios(n, epsilon, beta)]));
end
