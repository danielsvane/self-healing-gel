function absorption
    clc; clf; close all;
    
    figure
    plotData('Al.csv', 1, 'Al pH 1.79');
    plotData('Al.csv', 3, 'Al pH 3.04');
    plotData('Al.csv', 5, 'Al pH 5.96');
    plotData('Al.csv', 7, 'Al pH 8.92');
    plotData('Al.csv', 9, 'Al pH 11.91');
    axis([200,450,0,4.5]);
    xlabel('Wavelength [nm]');
    ylabel('Absorbance');
    legend(gca,'show');
    saveas(gcf, 'plots/al_absorption', 'epsc');
    
    figure
    plotData('Fe.csv', 1, 'Fe pH 1.02');
    plotData('Fe.csv', 3, 'Fe pH 2.93');
    plotData('Fe.csv', 5, 'Fe pH 5.94');
    plotData('Fe.csv', 7, 'Fe pH 9.30');
    plotData('Fe.csv', 9, 'Fe pH 11.93');
    axis([200,450,0,4.5]);
    xlabel('Wavelength [nm]');
    ylabel('Absorbance');
    legend(gca,'show');
    saveas(gcf, 'plots/fe_absorption', 'epsc');
    
end

function plotData(file, row, legend)

    wavelength = csvread(file,2,0,[2,0,602,0]);
    absorption = csvread(file,2,row,[2,row,602,row]); 

    hold on
    plot(wavelength, absorption, 'displayname', legend);
end