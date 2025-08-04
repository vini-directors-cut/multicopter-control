% Variaveis Globais =======================================================
frame_type = "quadx";

g = 9.806; % [m/s2]

b = 2.0E-6 * (60/(2*pi))^2;  % Fator Empuxo [N.s2]  -> SALMA (2020)
d = 2.1E-7 * (60/(2*pi))^2;   % Fator Arrasto/Torque [Nm.s2] -> SALMA (2020)

P = 4; % Numero de helices

L = 0.450; % Comprimento [m]

m = 1.172; % Massa total [kg]

% Tensor de Inercia
Ixx = 133498.5 * 1E-07;  % [kg.m2]
Iyy = 141456.8 * 1E-07;  % [kg.m2]
Izz = 210066.0 * 1E-07;  % [kg.m2]
Ixy = -1985.4 * 1E-07;
Ixz = -5432.7 * 1E-07;
Iyx = -1985.4 * 1E-07;
Iyz = 5432.4 * 1E-07; 
Izx = -5432.7 * 1E-07;
Izy = 5432.4 * 1E-07;

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
Kp_roll_rate = 0.135;
Ki_roll_rate = 0.135;
Kd_roll_rate = 0.0036;
Tf_roll_rate = 0.1;

Kp_pitch_rate = 0.135;
Ki_pitch_rate = 0.135;
Kd_pitch_rate = 0.0036;
Tf_pitch_rate = 0.1;

Kp_yaw_rate = 0.135;
Ki_yaw_rate = 0.135;
Kd_yaw_rate = 0.0;
Tf_yaw_rate = 0.1;

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

% s = tf('s');
% 
% % Controladores PID discretos
% pid_roll_rate = pid(Kp_roll_rate, Ki_roll_rate, Kd_roll_rate, Tf_roll_rate);
% pid_roll_rate_z = c2d(pid_roll_rate, 1/controller1_freq_hz, 'tustin')
% 
% pid_pitch_rate = pid(Kp_pitch_rate, Ki_pitch_rate, Kd_pitch_rate, Tf_pitch_rate);
% pid_pitch_rate_z = c2d(pid_pitch_rate, 1/controller1_freq_hz, 'tustin')
% 
% pid_yaw_rate = pid(Kp_yaw_rate, Ki_yaw_rate, Kd_yaw_rate, Tf_yaw_rate);
% pid_yaw_rate_z = c2d(pid_yaw_rate, 1/controller1_freq_hz, 'tustin')



