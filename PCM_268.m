clear; close all; clc;

[s, Fs] = audioread('speech.wav');
for bit = [2, 6, 8]
    %% Compression by PCM
    bit_to_deci = 2^bit;
    s_pcm = round(s * bit_to_deci);     %% �����Ɋۂ߂Ă� 
    s_pcm = s_pcm / bit_to_deci;        %% �����Ɋۂ߂����̂�{���Ŋ�����
    sound_name = char(compose("output%d.wav", bit));
    audiowrite(sound_name , s_pcm, Fs);

    %% Show figures
    figure(bit);
    subplot(3,1,1);
    plot(s);        %% �I���W�i���T�E���h�̔g�`��\��
    title('Original sound.');
    subplot(3,1,2);
    plot(s_pcm);    %% �ύX��̃T�E���h�̔g�`��\��
    title('Sound compressed by ' + string(bit) + '-bit PCM.');
    subplot(3,1,3);
    plot(abs(s_pcm - s));    %% �������g�`�Ƃ̍������Ƃ���
    title('abs(s_pcm - s)');
end