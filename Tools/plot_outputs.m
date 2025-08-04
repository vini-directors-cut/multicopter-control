out1 = evalin('base', 'out');

figure(1)
pos = out1.pos_out.Data;
time = out1.pos_out.Time;
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

figure(2)
atittude = out1.att_out.Data;
time2 = out1.att_out.Time;
plot(time2,atittude(:,1),time2,atittude(:,2),time2,atittude(:,3))
legend('\phi','\theta','\psi')

figure(3)
omegas = out1.omegas.Data;
t3 = out1.omegas.Time;
plot(t3, omegas(:,1)*60/(2*pi), ...
    t3,omegas(:,2)*60/(2*pi), ...
    t3,omegas(:,3)*60/(2*pi), ...
    t3,omegas(:,4)*60/(2*pi))
legend('\Omega_1','\Omega_2','\Omega_3','\Omega_4')

figure(4)
plot(time, pos_r(:,3),'--', ...
    time, pos(:,3))
legend('ref','z')
