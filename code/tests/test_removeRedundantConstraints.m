A = rand(10,3);
b = rand(10,1);

% create polyhedron
P = Polyhedron('A',A,'b',b);

% display some information about the polyhedron
P.display();

% remove all redundant constraints
reducedP = removeRedundantConstraints(P);

% display some information about the reduced polyhedron
reducedP.display();
