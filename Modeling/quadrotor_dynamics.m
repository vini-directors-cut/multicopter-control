
function out = quadrotor_dynamics(in)

glob;

% Estados: [u v w p q r x y z phi theta psi]
u = in(1);
v = in(2);
w = in(3);
p = in(4);
q = in(5);
r = in(6);
x = in(7);
y = in(8);
z = in(9);
phi = in(10);
theta = in(11);
psi = in(12);

Omega = in(13:16);

% Entradas:
U1 = in(17);
U2 = in(18);
U3 = in(19);
U4 = in(20);

inertia_sim = in(21);

% Matriz de transformação que relaciona u,v,w com x_dot,y_dot,z_dot
R_matrix=[cos(theta)*cos(psi), sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi), ...
        cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi); ...
        cos(theta)*sin(psi), sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi), ...
        cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi); ...
        -sin(theta), sin(phi)*cos(theta), cos(phi)*cos(theta)];
    
% Matriz de transformação que relaciona p,q,r com phi_dot,theta_dot,psi_dot
T_matrix=[1, sin(phi)*tan(theta), cos(phi)*tan(theta); ...
        0, cos(phi), -sin(phi); ...
        0, sin(phi)*sec(theta), cos(phi)*sec(theta)];

% Velocidade para efeito giroscopico das helices [rad/s]
Om = +Omega(1)+Omega(2)-Omega(3)-Omega(4);

if inertia_sim == 1.0
    % Equações descrevendo a dinâmica não-linear do quadricóptero
    out(1)=(v*r-w*q)+g*sin(theta);                %u_dot
    out(2)=(w*p-u*r)-g*cos(theta)*sin(phi);       %v_dot
    out(3)=(u*q-v*p)-g*cos(theta)*cos(phi)+U1/m;  %w_dot
    out(4)=q*r*(Iyy-Izz)/Ixx-jr/Ixx*q*Om+U2/Ixx;  %p_dot
    out(5)=p*r*(Izz-Ixx)/Iyy+jr/Iyy*p*Om+U3/Iyy;  %q_dot
    out(6)=p*q*(Ixx-Iyy)/Izz+U4/Izz;              %r_dot
    out(7)=R_matrix(1,:)*[u;v;w];                 %x_dot
    out(8)=R_matrix(2,:)*[u;v;w];                 %y_dot
    out(9)=R_matrix(3,:)*[u;v;w];                 %z_dot
    out(10)=T_matrix(1,:)*[p;q;r];                %phi_dot
    out(11)=T_matrix(2,:)*[p;q;r];                %theta_dot
    out(12)=T_matrix(3,:)*[p;q;r];                %psi_dot
else
    % Matrizes e vetores para uso do calculo das saídas
    I = [[Ixx, -Ixy, -Ixz];[-Iyx, Iyy, -Iyz];[-Izx, -Izy, Izz]];
    wb = [p;q;r];
    Vb = [u;v;w];
    Lambda_in = [0; 0; U1; U2; U3; U4];
    Lambda_g = [m*g*sin(theta);
        -m*g*cos(theta)*sin(phi);
        -m*g*cos(theta)*cos(phi);
        0; 0; 0];
    Lambda_gr = [0; 0; 0;
        q* jr* Om;
        -p* jr* Om;
        0];

    v1 = cross(wb,Vb);
    v2 = cross(wb, I*wb);

    Cas = [v1;v2];
    Mas = [[m*eye(3) zeros(3)]; [zeros(3) I]];

    vb = inv(Mas)*(-Cas + Lambda_in + Lambda_g + Lambda_gr);

    % Equações descrevendo a dinâmica não-linear do quadricóptero com tensor de
    % inércia assimétrico
    out(1)=vb(1);  %u_dot
    out(2)=vb(2);  %v_dot
    out(3)=vb(3);  %w_dot
    out(4)=vb(4);  %p_dot
    out(5)=vb(5);  %q_dot
    out(6)=vb(6);  %r_dot
    out(7)=R_matrix(1,:)*[u;v;w];  %x_dot
    out(8)=R_matrix(2,:)*[u;v;w];  %y_dot
    out(9)=R_matrix(3,:)*[u;v;w];  %z_dot
    out(10)=T_matrix(1,:)*[p;q;r]; %phi_dot
    out(11)=T_matrix(2,:)*[p;q;r]; %theta_dot
    out(12)=T_matrix(3,:)*[p;q;r]; %psi_dot
end
