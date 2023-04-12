%%  Rotation
R=rot2(0.2)
syms theta
theta = 60;
R1=rot2(theta)
%% Orthonormal Rotation Matrix in Toolbox
syms theta
Rx = rotx(theta)
Ry = roty(theta)
Rz = rotz(theta) 

Rx = rotx(pi/2)
trplot(Rx)
tranimate(Rx)

Rxy = rotx(pi/2) * roty(pi/2)
tranimate(Rxy)

%% Transforamtion (Translation & Rotation) 
T1 = transl2(1,2)*trot2(90,'deg')
plotvol([-5 5 -5 5]);
trplot2(T1, 'frame', 'Frame 1', 'color', 'b')

T2 = transl2(2, 1)
trplot2(T2, 'frame', 'Frame 2', 'color', 'r');

T3 = T1*T2
trplot2(T3, 'frame', 'Frame 3', 'color', 'g');

T4 = T2*T1;
trplot2(T4, 'frame', 'Frame 4', 'color', 'c'); 

P = [3 ; 2 ];
plot_point(P, 'label', 'Point P', 'solid', 'ko');

%% Quaternion in Toolbox
% converts rotation matrix to a unit quaternion
q = UnitQuaternion( rpy2tr(0.1, 0.2, 0.3) )

%convert quaternion to rotation matrix
q.R 
%% Pose in 3D in Toolbox
%representing a walk along the x-axis for 1 unit, then a rotation by 90° about the x-axis and 
% then a walk of 1 unit along the new y-axis which was the previous z-axis. 
T = transl(1, 0, 0) * trotx(pi/2) * transl(0, 1, 0) 
trplot(T)

T1= t2r(T) 
T2= transl(T)
%% Homogeneous Transformation in Toolbox
%Generic
syms q1 q2 q3 a1 a2 
trchain2('R(q1) Tx(a1) R(q2) Tx(a2)', [q1 q2 q3])
syms q1 q2 q3 a1 a2 a3 
trchain2('R(q1) Tx(a1) R(q2) Tx(a2) R(q3) Tx(a3)', [q1 q2 q3])

%T = trchain2(s, q) is a homogeneous transform (3x3) % results from compounding a number of individual transformations 
% trchain('R(q1)Tx(a1)R(q2)Ty(a3)R(q3)', [1 2 3]) is equivalent to computing:
% trot2(1) * transl2(a1,0) * trot2(2) * transl2(0,a3) * trot2(3)
a1=1.0;
q1=0.2;
trchain2 ('R(q1) Tx(a1)', q1)
%% DH Table in Toolbox
dh = [ 0 0 1 0; 
       0 0 1 0 ]   
% each row corresponds to one row of DH table i.e theta, d, a and alpha parameters of each joint 

r = SerialLink(dh, 'name', 'two-link RR')
a= r.tool
b= r.gravity
c= r.base

r.plot([0.2 0.3])
r.teach

r.fkine([0.2 0.3])
%returns the pose of end-effector
%% PUMA in Toolbox
mdl_puma560
p560

p560.plot(qz)
p560.plot(qr)
p560.teach
p560.fkine ([0.1 0.2 0.3 0.4 0.5 0.6])

