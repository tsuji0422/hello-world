clear; close all; clc;

[s, Fs] = audioread('speech.wav');
for bit = [2, 6, 8]
    %% Compression by PCM
    bit_to_deci = 2^bit;
    s_pcm = round(s * bit_to_deci);     %% 整数に丸めてる 
    s_pcm = s_pcm / bit_to_deci;        %% 整数に丸めたものを倍数で割った
    sound_name = char(compose("output%d.wav", bit));
    audiowrite(sound_name , s_pcm, Fs);

    %% Show figures
    figure(bit);
    subplot(3,1,1);
    plot(s);        %% オリジナルサウンドの波形を表示
    title('Original sound.');
    subplot(3,1,2);
    plot(s_pcm);    %% 変更後のサウンドの波形を表示
    title('Sound compressed by ' + string(bit) + '-bit PCM.');
    subplot(3,1,3);
    plot(abs(s_pcm - s));    %% 正しい波形との差分をとった
    title('abs(s_pcm - s)');
end