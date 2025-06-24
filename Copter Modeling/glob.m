% Variaveis Globais =======================================================
frame_type = "quadx";

g = 9.806; % [m/s2]

b = 3.13E-5;  % Fator Empuxo [N.s2]
d = 7.5E-7;   % Fator Empuxo [Nm.s2]

P = 4; % Numero de helices

L = 0.232; % Comprimento [m]

m = 0.53; % Massa total [kg]

% Tensor de Inercia
Ixx = 6.228e-3;  % [kg.m2]
Iyy = 6.228e-3;  % [kg.m2]
Izz = 1.122e-2;  % [kg.m2]

% Inercia do rotor
r=4;           % redução
jm = 4e-7;     % [kg.m2]
jp = 6e-5;     % [kg.m2]
jr = jp+jm/r;  % [kg.m2]

% Variáveis do Controle
dt = 0.01; % [s]

controller1_freq_hz = 400;
controller2_freq_hz = 100;
controller3_freq_hz = 50;
controller4_freq_hz = 20;

% Parametros dos controladores
Kp_roll_rate = tf(0.135);
Ki_roll_rate = tf(0.135, [1 0]);
Kd_roll_rate = tf([0.0036 0], 1);

Kp_pitch_rate = tf(0.135);
Ki_pitch_rate = tf(0.135, [1 0]);
Kd_pitch_rate = tf(0.0036, 1);

Kp_yaw_rate = tf(0.135);
Ki_yaw_rate = tf(0.135, [1 0]);
Kd_yaw_rate = tf(0.0, 1);

Kp_roll = tf(4.5);

Kp_pitch = tf(4.5);

Kp_yaw = tf(4.5);

Kp_x_rate = tf(1);
Ki_x_rate = tf(0.5, [1 0]);
Kd_x_rate = tf(0.0, 1);

Kp_y_rate = tf(1);
Ki_y_rate = tf(0.5, [1 0]);
Kd_y_rate = tf(0.0, 1);

Kp_z_rate = tf(5);
Ki_z_rate = tf(2, [1 0]);
Kd_z_rate = tf(0.0, 1);

Kp_x = tf(1);

Kp_y = tf(1);

Kp_z = tf(1);

% Parâmetros dos controladores discretizados
Kp_roll_rate_z = c2d(Kp_roll_rate, 1/controller1_freq_hz, 'tustin').Numerator{1};
Ki_roll_rate_z = c2d(Ki_roll_rate, 1/controller1_freq_hz, 'tustin').Numerator;
Kd_roll_rate_z = c2d(Kd_roll_rate, 1/controller1_freq_hz, 'tustin');

Kp_pitch_rate_z = c2d(Kp_pitch_rate, 1/controller1_freq_hz, 'tustin').Numerator{1};
Ki_pitch_rate_z = c2d(Ki_pitch_rate, 1/controller1_freq_hz, 'tustin');
Kd_pitch_rate_z = c2d(Kd_pitch_rate, 1/controller1_freq_hz, 'tustin');

Kp_yaw_rate_z = c2d(Kp_yaw_rate, 1/controller1_freq_hz, 'tustin').Numerator{1};
Ki_yaw_rate_z = c2d(Ki_yaw_rate, 1/controller1_freq_hz, 'tustin');
Kd_yaw_rate_z = c2d(Kd_yaw_rate, 1/controller1_freq_hz, 'tustin');

Kp_roll_z = c2d(Kp_roll, 1/controller2_freq_hz, 'tustin').Numerator{1};

Kp_pitch_z = c2d(Kp_pitch, 1/controller2_freq_hz, 'tustin').Numerator{1};

Kp_yaw_z = c2d(Kp_pitch, 1/controller2_freq_hz, 'tustin').Numerator{1};

Kp_x_rate_z = c2d(Kp_x_rate, 1/controller3_freq_hz, 'tustin').Numerator{1};
Ki_x_rate_z = c2d(Ki_x_rate, 1/controller3_freq_hz, 'tustin');
Kd_x_rate_z = c2d(Kd_x_rate, 1/controller3_freq_hz, 'tustin');

Kp_y_rate_z = c2d(Kp_y_rate, 1/controller3_freq_hz, 'tustin').Numerator{1};
Ki_y_rate_z = c2d(Ki_y_rate, 1/controller3_freq_hz, 'tustin');
Kd_y_rate_z = c2d(Kd_y_rate, 1/controller3_freq_hz, 'tustin');

Kp_z_rate_z = c2d(Kp_z_rate, 1/controller3_freq_hz, 'tustin').Numerator{1};
Ki_z_rate_z = c2d(Ki_z_rate, 1/controller3_freq_hz, 'tustin');
Kd_z_rate_z = c2d(Kd_z_rate, 1/controller3_freq_hz, 'tustin');

Kp_x_z = c2d(Kp_x, 1/controller4_freq_hz, 'tustin').Numerator{1};

Kp_y_z = c2d(Kp_y, 1/controller4_freq_hz, 'tustin').Numerator{1};

Kp_z_z = c2d(Kp_z, 1/controller4_freq_hz, 'tustin').Numerator{1};