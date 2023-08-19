function code = analysis(filename)
    keypad = ['1' '2' '3';
            '4' '5' '6';
            '7' '8' '9';
            '*' '0' '#'];
    [x,fs] = audioread(filename);
    fr = [697 770 852 941];
    fc = [1209 1336 1477];
    Ts = 1/fs;
    Ton = 0.1;
    t = Ts:Ts:Ton;
    off = 0*t;
    r = [];
    code = [];
    for k = 1:2*length(t):length(x)
        new = x(k:k+length(t)-1);
        new = transpose(new);
        for j = 1:3
            for i = 1:4
                y1 = sin(2*pi*fr(i)*t);
                y2 = sin(2*pi*fc(j)*t);
                y = (y1 + y2)/2;
                r(i,j) = sum(new.*y)/(sum(new.^2)*sum(y.^2))^0.5;
            end
        end
        ind_key = r == max(max(r));
        key = keypad(ind_key);
        code = [code key];
    end
end
