function [Pxx, t, f] = spectrogram_Welch(data, fs, window_size, window, noverlap, dt)

    arguments
        data
        fs = 1
        window_size = fs*0.25
        window = hamming(window_size)
        noverlap = 0.5*window_size
        dt = 60                         %sec
    end

    t = 0 : dt : length(data)/fs-1;
    Pxx = zeros(ceil(window_size/2)+1, ceil(length(data)/fs/dt));
    
    for i=0:ceil(length(data)/fs/dt)-1
        [pxx,f] = pwelch(data(fs*dt*i+1 : fs*dt*(i+1)), window, noverlap, window_size, fs);
        Pxx(:,i+1) = pxx;
    end

end