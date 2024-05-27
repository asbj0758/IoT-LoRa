clear all;
close all;
TxPow = 2; % 2-15 dBm
frequency = 868;
RXPow = [];
noisePower = -150; % in dBm

% Sweep over tx power and distance
for p = 2:1:15
    for d = 0:5:10000
        RXPow(p-1,(d/5)+1) = calculate_LoRa_power(p,d,frequency,1,2,2);
    end
end
%%
x = linspace(0,10000,10000/5+1);
plot(x,RXPow);

legend('Tx 2 dBm','Tx 15 dBm')
xlabel('Distance (m)') 
ylabel('Rx Power (dBm)') 

power_linear = 10.^(RXPow / 10);

noise_linear = 10^(noisePower / 10);

SNR = db(power_linear/noise_linear);

f2 = figure;
x = linspace(0,10000,10000/5+1);
plot(x,SNR);

legend('Tx 2 dBm','Tx 15 dBm')
xlabel('Distance (m)') 
ylabel('SNR (dB)') 



%%
function power_expected = calculate_LoRa_power(input_power_dBm, distance, freq_MHz, antenna_gain_Tx, antenna_gain_Rx, path_loss_exponent)
    % Speed of light (m/s)
    c = 3e8;
    
    % Convert frequency to Hz
    freq_Hz = freq_MHz * 1e6;
    
    % Calculate the wavelength
    lambda = c / freq_Hz;
    
    % Calculate free-space path loss (in dB)
    path_loss_dB = 20 * log10(4 * pi * distance / lambda);
    
    % Calculate total path loss including path loss exponent
    total_path_loss_dB = path_loss_dB + 10 * path_loss_exponent * log10(distance);
    
    % Calculate received power (in dBm)
    received_power_dBm = input_power_dBm + antenna_gain_Tx + antenna_gain_Rx - total_path_loss_dB;
    
    power_expected = received_power_dBm;
end