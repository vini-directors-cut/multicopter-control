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