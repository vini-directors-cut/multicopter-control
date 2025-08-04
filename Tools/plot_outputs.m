out1 = evalin('base', 'out');

% Trajetoria em 3 dimensoes
figure(1)
pos = out1.pos_out.Data;
t = out1.pos_out.Time;
plot3(pos(:,1), pos(:,2), pos(:,3), 'b-', 'LineWidth', 1);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D Position Trajectory');
grid on; axis equal;
pos_r = out1.setpoints.Data;
hold on;
plot3(pos_r(:,1), pos_r(:,2), pos_r(:,3), '--', 'LineWidth', 1);
title('Trajetória do VANT em 3 dimensões');
legend('Trajetória do VANT','Setpoint')
grid on; axis equal;


% Saidas de orientacao
figure(2)
atittude = out1.att_out.Data;
time2 = out1.att_out.Time;
phitheta_refs = out.setpoints2.Data;
plot(time2,atittude(:,1),time2,atittude(:,2),time2,atittude(:,3))
hold on;
plot(time2, phitheta_refs(:,2), '--', ...
     time2, phitheta_refs(:,3), '--', ...
     time2, phitheta_refs(:,4), '--')
legend('\phi','\theta','\psi', '\phi_R','\theta_R','\psi_R')


% Setpoints de rotacao dos propulsores
figure(3)
omegas = out1.omegas.Data;
t3 = out1.omegas.Time;
t3_new = 0:0.000005:20;
omegas1 = interp1(t3, omegas(:,1), t3_new,'previous');
omegas2 = interp1(t3, omegas(:,2), t3_new,'previous');
omegas3 = interp1(t3, omegas(:,3), t3_new,'previous');
omegas4 = interp1(t3, omegas(:,4), t3_new,'previous');
plot(t3_new, omegas1*60/(2*pi), ...
    t3_new,omegas2*60/(2*pi), ...
    t3_new,omegas3*60/(2*pi), ...
    t3_new,omegas4*60/(2*pi))
legend('\Omega_1','\Omega_2','\Omega_3','\Omega_4');
xlabel('Tempo (s)');
ylabel('Rotação (rpm)');


% Posicao em Z
figure(4)
plot(t, pos_r(:,3),'--', ...
    t, pos(:,3))
legend('ref','z')
xlabel('Tempo (s)');
ylabel('Altitude (m)');


% Entradas
figure(5)
t5 = out.U.Time;
t5_new = 0:0.000005:20;
U = out.U.Data;
U1 = interp1(t5, U(:,1), t5_new,'previous');
U2 = interp1(t5, U(:,2), t5_new,'previous');
U3 = interp1(t5, U(:,3), t5_new,'previous');
U4 = interp1(t5, U(:,4), t5_new,'previous');
subplot(2,1,1);
plot(t5_new, U1, 'r');
title('U1');
xlabel('Tempo (s)');
ylabel('Empuxo (N)');
grid on;

subplot(2,1,2);
plot(t5_new, U2, 'b', ...
     t5_new, U3, 'g', ...
     t5_new, U4, 'k');
title('U2, U3 e U4');
xlabel('Tempo (s)');
ylabel('Torque (N \cdot m)');
legend('U2', 'U3', 'U4');
grid on;


% Velocidades Lineares e angulares
figure(6)
pos_rate = out.pos_rate_out.Data;
att_rate = out.att_rate_out.Data;
t_ref = out.pos_rate_ref.Time;
pos_rate_ref = out.pos_rate_ref.Data;
att_rate_ref = out.att_rate_ref.Data;
subplot(3,2,1);
plot(t, pos_rate(:,1), t_ref, pos_rate_ref(:,1),'--')
ylabel('u (m/s)');
subplot(3,2,3);
plot(t, pos_rate(:,2), t_ref, pos_rate_ref(:,2),'--')
ylabel('v (m/s)');
subplot(3,2,5);
plot(t, pos_rate(:,3), t_ref, pos_rate_ref(:,3),'--')
xlabel('Tempo (s)');
ylabel('w (m/s)');
subplot(3,2,2);
plot(t, att_rate(:,1), t_ref, att_rate_ref(:,1),'--')
ylabel('p (rad/s)');
subplot(3,2,4);
plot(t, att_rate(:,2), t_ref, att_rate_ref(:,2),'--')
ylabel('q (rad/s)');
subplot(3,2,6);
plot(t, att_rate(:,3), t_ref, att_rate_ref(:,3),'--')
ylabel('r (rad/s)');
xlabel('Tempo (s)');