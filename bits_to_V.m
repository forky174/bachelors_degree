function data_array_V = bits_to_V(data, adc_resolution, V_max)

    data_array_V = data * V_max / 2^(adc_resolution-1);
    
end