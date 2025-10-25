function SPL = spl_band(Pxx, f, constant, type, center_freq, freq_range)

    arguments
        Pxx
        f
        constant
        type        = 'band'
        center_freq = 100     % if type='third_octave' => center_freq
        freq_range  = 100
    end

    df = f(2)-f(1);

    if strcmp(type, 'third_octave')
        lower_limit = center_freq/1.22;
        upper_limit = center_freq*1.22;
    elseif strcmp(type, 'band')
        lower_limit = center_freq-freq_range/2;
        upper_limit = center_freq+freq_range/2;
    end

    low = find(f>lower_limit,1);
    upp = find(f>upper_limit,1)-1;
    SPL = 10*log10(sum(abs(Pxx(low:upp,:)),1))- constant + 10*log10(df);

end