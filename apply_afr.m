function Pxx = apply_afr(AFR_freq, AFR, f, Pxx)

    %     Рассчет коэффициентов полинома для аппроксимации АЧХ:
    %       + до 100 Гц полином третьей степени с фиксированными точками (0,0) и (100,1) и фиксированной производной в точке f=100
    %       + после 100 Гц полином пятой степени с фиксированной точкой (100,1) и фиксированной производной в точках f=100 и f=16000
    first_part_size = 100;
    p1 = polyfix(   AFR_freq(1:first_part_size),   AFR(1:first_part_size), 3, [0 100], [0 1],         100,     0);
    p2 = polyfix( AFR_freq(first_part_size:end), AFR(first_part_size:end), 5,     100,     1, [100 16000], [0 0]);

    y1 = polyval(p1,f(f < first_part_size));
    y2 = polyval(p2,f(f >= first_part_size));
    fr = cat(1,y1,y2);

    for k=1:size(Pxx,1)
        Pxx(k,:)=Pxx(k,:)./(fr(k))^2;
    end

end