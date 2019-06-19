function R = sensitivityMatrix(testGrid);

Y = makeYbus(testGrid);
X = inv(Y(1:end-1,1:end-1));
R = full(real(X));