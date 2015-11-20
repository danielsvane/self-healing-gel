function rheology()
    handleData('nano_test.xls', 'Fe 9.07', 'good_fe_907.eps');
    handleData('nano_test.xls', 'Fe 10.69', 'good_fe_1069.eps');
    handleData('rheology.xls', 'Fe 9.63', 'bad_fe_963.eps');
    handleData('rheology.xls', 'Fe 8.52', 'bad_fe_852.eps');
    handleData('rheology.xls', 'Al 9.39', 'bad_al_939.eps');
end

function handleData( file, sheet, name )

    time1 = xlsread(file, sheet,'C30:C129');
    time2 = xlsread(file, sheet, 'C254:C303');
    storage1 = xlsread(file, sheet, 'F30:F129');
    storage2 = xlsread(file, sheet, 'F254:F303');
    loss1 = xlsread(file, sheet, 'G30:G129');
    loss2 = xlsread(file, sheet, 'G254:G303');

    figure
    storagePlot = plot(time1, storage1, 'b');
    hold on
    plot(time2, storage2, 'b');
    hold on
    lossPlot = plot(time1, loss1, 'r');
    hold on
    plot(time2, loss2, 'r');

    legend([storagePlot lossPlot], {'Storage', 'Loss'}, 'location', 'best');
    xlabel('Time [min]');
    ylabel('Modulus [Pa]');
    xlim([min(time1) max(time2)]);

    saveas(gcf, ['plots/' name], 'epsc');
end