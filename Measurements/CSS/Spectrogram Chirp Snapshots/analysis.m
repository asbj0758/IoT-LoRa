%meas1 = importfile('SA_240513153302.csv');
%meas2 = importfile('SA_240513153300.csv')
meas3 = importfile('SA_240513153257.csv')
%meas4 = importfile('SA_240513153254.csv')
%meas5 = importfile('SA_240513153249.csv')
%meas6 = importfile('SA_240513153245.csv')
%meas7 = importfile('SA_240513153240.csv')
%meas8 = importfile('SA_240513153235.csv')
%meas9 = importfile('SA_240513153230.csv')
%meas10= importfile('SA_240513153223.csv')
%meas11= importfile('SA_240513153211.csv')

close all;
figure;
plot(meas1.MachineModule,meas1.SpectrumAnalyzer);
figure;

plot(meas2.MachineModule,meas2.SpectrumAnalyzer);
figure;

plot(meas3.MachineModule*1e-6, meas3.SpectrumAnalyzer);
xlabel('Frequency (MHz)');
ylabel('Power (dBm)');

figure;
plot(meas4.MachineModule,meas4.SpectrumAnalyzer);
figure;

plot(meas5.MachineModule,meas5.SpectrumAnalyzer);
figure;

plot(meas6.MachineModule,meas6.SpectrumAnalyzer);
figure;

plot(meas7.MachineModule,meas7.SpectrumAnalyzer);
figure;

plot(meas8.MachineModule,meas8.SpectrumAnalyzer);
figure;

plot(meas9.MachineModule,meas9.SpectrumAnalyzer);
figure;

plot(meas10.MachineModule,meas10.SpectrumAnalyzer);
figure;

plot(meas11.MachineModule,meas11.SpectrumAnalyzer);


