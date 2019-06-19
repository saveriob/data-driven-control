function saveFigure(filename)

figureNumber = gcf;
figureNumber.PaperPositionMode = 'manual';
figureNumber.PaperUnits = 'inches';
figureNumber.PaperPosition = [0.25 0.25 16 8];
fig_pos = figureNumber.PaperPosition;
figureNumber.PaperSize = [fig_pos(3) fig_pos(4)];
print(figureNumber,sprintf('../output/%s.pdf',filename),'-fillpage', '-dpdf');
