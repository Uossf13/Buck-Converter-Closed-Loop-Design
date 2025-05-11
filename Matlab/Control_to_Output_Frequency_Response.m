% Synchronous Buck Converter Element Values

L = 1e-6;                       % Inductance
RL = 30e-3;                     % Inductor Resistance
C = 200e-6;                     % Output Capacitance
Resr = 0.8e-6;                  % Output Capacitor Resistance
Vg = 5;                         % Input Voltage
R = 10e3;                       % Load Resistance
VM = 1;                         % PWM Saw Tooth Amplitude
Vref = 1.8;                     % Reference Voltage
H = 1;                          % Sensing Gain

% Transfer Function Parameters

wesr = 1/(C*Resr);              %esr Zero
wo = 1 /sqrt(C*L);              
Qloss = sqrt(L/C)/(Resr+RL);
Qload = R/sqrt(L/C);
Q = Qloss+Qload/(Qloss+Qload);  %Q factor

% Open loop Control to Output Transfer Function

s = tf('s');
Gvd = Vg * (1+(s/wesr))/(1+(s/(Q*wo))+(s/wo)^2);


%



Gvd_figure = figure(1);
bode(Gvd);
