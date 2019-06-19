function n = numberOfScenarios(d, epsilon, beta);

% Example values
% d = 1;
% epsilon = 0.05;
% beta = 1e-3;

n = d+1;
nb = 0;

while true
    nb = 0;
    for ii = 0:(d-1)
        nb = nb + nchoosek(n,ii) * epsilon^ii * (1-epsilon)^(n-ii);
    end
    if nb <= beta
        break;
    end
    n = n+1;
end
