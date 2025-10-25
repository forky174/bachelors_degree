function [fs, constant, AFR_freq, AFR] = get_station_parameters(station)
    
    arguments
        station
    end

    fs                  = 32000;     % Hz
    
    M1_amplifier_dB     = 26.0;      % dB
    M3_amplifier_dB     = 32.0;      % dB
    M1_sensitivity_dB   = -170.0;    % dB re 1V/µPa
    M3_sensitivity_dB   = -165.0;    % dB re 1V/µPa

    load('AFR.mat', 'f');
    AFR_freq = f;
    clear f;
    
    if strcmp(station, 'M1')
        load('AFR.mat', 'afrM1');
        AFR = afrM1;
        clear afrM1;
        constant = M1_sensitivity_dB + M1_amplifier_dB;
    elseif strcmp(station, 'M3')
        load('AFR.mat', 'afrM3');
        AFR = afrM3;
        clear afrM3;
        constant = M3_sensitivity_dB + M3_amplifier_dB;
    else
        error('Unknown station');
    end

end