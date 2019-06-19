function reducedPoly = removeRedundantConstraints( poly )

OPTIONS.Display = 'off';
tol = 1e-8;

A = poly.A;
b = poly.b;

validRows = true(size(b));

for i = 1:size(A,1)

    [~,fval] = linprog(-A(i,:)',A(validRows,:),b(validRows),[],[],[],[],OPTIONS);
    validRows(i) = (-fval > b(i) - tol);
    
end

reducedPoly = Polyhedron('A',A(validRows,:),'b',b(validRows));

