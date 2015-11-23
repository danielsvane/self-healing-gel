function rheology2()
    clc; clf; clear all; close all;

    handleData('data/nano_test.xls', {'Fe 9.07', 'Fe 10.69'}, 'plots/good_rheology.eps');
    handleData('data/rheology.xls', {'Fe 9.63', 'Fe 8.52', 'Al 9.39'}, 'plots/bad_rheology.eps');
end

function handleData( file, sheets, name )

    figure

    m = size(sheets,2);

    subplot('position', [0.1, 0.1, 0.4, 0.8]);
    
    for i = 1:m
        sheet = char(sheets(i))
        strain = xlsread(file, sheet,'D30:D129');
        storage = xlsread(file, sheet, 'F30:F129');
        
        hold on
        plot(strain, storage);
        set(gca,'xscale','log','XTickLabel',num2str(get(gca,'XTick')'))
        xlim([min(strain) max(strain)]);
        ylim([0 1400]);
        ylabel('Storage modulus [Pa]')
        xlabel('Strain [%]')
    end
    
    subplot('position', [0.5, 0.1, 0.4, 0.8]);
    
    for i = 1:m
        sheet = char(sheets(i))
        time = xlsread(file, sheet, 'C254:C303');
        time = (time-time(1))*60;
        storage = xlsread(file, sheet, 'F254:F303');
        
        hold on
        plot(time, storage, 'displayname', sheet);
        ylim([0 1400]);
        xlim([min(time) max(time)]);
        xlabel('Time [s]')
        set(gca,'yticklabel',[],'ycolor',[0.7 0.7 0.7]);
    end
    
    legend(gca,'show');
    
    tightfig;
    saveas(gcf, name, 'epsc');

end