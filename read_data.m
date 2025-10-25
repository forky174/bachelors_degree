function data_array = read_data(station, start_time, end_time, singe_file_duration, path)

    arguments
        station
        start_time
        end_time
        singe_file_duration = 600         %sec
        path = ''
    end

    duration = end_time - start_time;
    files_num = ceil(seconds(duration) / singe_file_duration);
    
    current_time = start_time;
    data_arrays = cell(files_num);
    
    for i = 1:files_num
        next_time = current_time + seconds(singe_file_duration);
        filename = file_name(station, current_time, next_time);
        
        fid = fopen([path filename], 'r');
        if fid == -1
            error(['Cannot open file: ' filename]);
        end
        
        samples = fread(fid, inf, 'int16');
        fclose(fid);
        
        data_arrays{i} = single(samples);
        current_time = next_time;
    end
    
    data_array = cat(1, data_arrays{:});

end