function out = xy_to_rollpitch (in)

glob;

xc = in(1);
yc = in(2);
zc = in(3);
yaw = in(4);
roll = in(5);
pitch = in(6);

U1= (((zc + g)*m)/(cos(roll)*cos(pitch)));

UX = ((xc*m)/U1);
UY = ((yc*m)/U1);

rolld = asin(UX*sin(yaw) - UY*cos(yaw)); 
pitchd = asin ((UX - sin(roll)*sin(yaw))/(cos(roll)*cos(yaw))); 

out(1) = U1;
out(2) = rolld;
out(3) = pitchd;
