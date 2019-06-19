function h = percentilePlot(data)

Q = quantile(data,[.05 .50 .95], 2);
h = errorbar(1:size(data,1),Q(:,2),Q(:,2)-Q(:,1),Q(:,3)-Q(:,2), 'k* ');
xlim([0 size(data,1)+1])
set(gca, 'YGrid', 'on');
