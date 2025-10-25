function psd_plot(t, f, Pxx, constant)
    figure('Position', [100, 100, 1000, 600]);
    imagesc(t/60, f, 10*log10(abs(Pxx)) - constant);
    axis xy;
    ylabel('Frequency [Hz]');
    xlabel('Time [min]');
    colorbar;
    c = colorbar;
    ylabel(c, 'PSD [dB re 1μPa^2/Hz]');
    title('Spectrogram');
    % saveas(gcf, 'Spectrogram1.png');
end