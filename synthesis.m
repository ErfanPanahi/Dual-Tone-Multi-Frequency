function synthesis(input_str)
    keypad = ['1' '2' '3';
            '4' '5' '6';
            '7' '8' '9';
            '*' '0' '#'];
    fr = [697 770 852 941];
    fc = [1209 1336 1477];
    fs = 8000;
    Ts = 1 / fs;
    Ton = 0.1; % Ton = Toff
    t = Ts:Ts:Ton;
    off = 0 * t;
    y_final = [];
    for k = input_str
        [i,j] = find(keypad == k);
        y1 = sin(2 * pi * fr(i) * t);
        y2 = sin(2 * pi * fc(j) * t);
        y = (y1 + y2) / 2;
        y_final = [y_final y off];
    end
    sound(y_final,fs);
    audiowrite('y.wav',y_final,fs);
end
