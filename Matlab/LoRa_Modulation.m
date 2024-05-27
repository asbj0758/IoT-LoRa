close all;
clear all;

SF = 7; %Spreading Factor
BW = 125; % Bandwidth in kHz
Fs = 125; % Sampling Frequency
s = 33; %send symbol '10'
%SNR = -25; %Signal to Noise Ratio
symbol_error_rate = [];
for s=7:1:12
    SF = s; %Spreading Factor
    for m=-40:2:0
        SNR = m; %Signal to Noise Ratio
        disp(m)
        %Generate a data symbol---
        num_samples = (2^SF)*Fs/BW;
        k = s; %adds to k to start (defines the data symbol)
        lora_symbol = zeros(1, num_samples);
        for n=1:num_samples
            if k>= (2^SF)
                k = k-2^SF;
            end
            k = k + 1;
            lora_symbol(n) = (1/(sqrt(2^SF)))*exp(1i*2*pi*(k)*(k/(2^SF*2)));
        end
        
        %plot(abs(lora_symbol))
        for j=1:100
            %Add noise
            lora_symbol_noisy = awgn(lora_symbol, SNR, 'measured');
            %Transmit
            % Receiver below
            
            
            %--------Generate the Base Down Chirp-----------
            base_down_chirp = zeros(1, num_samples);
            k = 0;
            for n=1:num_samples
                if k>= (2^SF)
                    k = k-2^SF;
                end
                k = k + 1;
                base_down_chirp(n) = (1/(sqrt(2^SF)))*exp(-1i*2*pi*(k)*(k/(2^SF*2)));
            end
            
            dechirped = lora_symbol_noisy.*(base_down_chirp);
            corrs = (abs(fft(dechirped)).^2);
            %plot(corrs);
            [~, ind] = max(corrs);
            ind2(j) = ind;
            pause(0.01)
        end
        
        %f3 = figure
        %histogram(ind2,2^SF)
        curr_symbol_error_rate = sum(ind2~=s+1)/j;
        symbol_error_rate(s-6,(m+41+1)/2) = curr_symbol_error_rate;
        %f4 = figure
        %spectrogram(lora_symbol,'yaxis')
        disp(symbol_error_rate)
    end
end
f6 = figure;
x = linspace(-40,0,40/2+1);
disp(symbol_error_rate)

plot(x,symbol_error_rate)
%%
plot(x,symbol_error_rate*100)
legend('SF7','SF8','SF9','SF10','SF11','SF12')
xlabel('SNR (dB)') 
ylabel('Symbol Error Rate (%)') 