function spl_plot(Pxx, t, f, constant, type, freq_array, freq_range)

    arguments
        Pxx
        t
        f
        constant
        type        = 'band'
        freq_array  = []
        freq_range  = 0
    end


    figure('Position', [100, 100, 1000, 600]);
    ylabel('SPL [dB re 1μPa^2]')
    xlabel('Time [min]')
    hold on

    for i=1:length(freq_array)
        plot(t/60, spl_band(Pxx, f, constant, type, freq_array(i), freq_range),'DisplayName', sprintf('f = %g Hz', freq_array(i)));
    end
  
    legend 
    hold off

end