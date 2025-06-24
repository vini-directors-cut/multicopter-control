function out = rotor_dynamics(in)

glob;

U(1) = in(1);
U(2) = in(2);
U(3) = in(3);
U(4) = in(4);

if frame_type == "quadplus" 
    Omega1 = sqrt(1/4*U(1)/b - 3/4*U(4)/d - U(2)/(b*L) - 1/2*U(3)/(b*L));
    Omega2 = sqrt(1/4*(U(1)/b + U(4)/d) + 1/2*U(3)/(b*L) + U(2)/(b*L));
    Omega3 = sqrt(1/4*(U(1)/b + U(4)/d) - 1/2*U(3)/(b*L));
    Omega4 = sqrt(1/4*(U(1)/b + U(4)/d) + 1/2*U(3)/(b*L));
elseif frame_type == "quadx"
    Omega1 = sqrt(1/4*(U(1)/b - sqrt(2)*U(2)/(b*L) - sqrt(2)*U(3)/(b*L) - U(4)/d));
    Omega2 = sqrt(1/4*(U(1)/b + sqrt(2)*U(2)/(b*L) + sqrt(2)*U(3)/(b*L) - U(4)/d));
    Omega3 = sqrt(1/4*(U(1)/b + sqrt(2)*U(2)/(b*L) - sqrt(2)*U(3)/(b*L) + U(4)/d));
    Omega4 = sqrt(1/4*(U(1)/b - sqrt(2)*U(2)/(b*L) + sqrt(2)*U(3)/(b*L) + U(4)/d));
end

out(1)=Omega1;
out(2)=Omega2;
out(3)=Omega3;
out(4)=Omega4;