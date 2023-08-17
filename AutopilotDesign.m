clc; close all; clear all;

%constant values

Iyy = 2.186e8; % [slug-ft^2]
m = 38901;     % [slug]
Tc = 2.361e6;  %[lbf]
V = 1347;  %[ft/s]
Cn_alpha = 0.1465;
g = 26.10; % [ft/s^2]
N_alpha = 686819; %[lbf/rad]
M_alpha = 0.3807; %[s^-2]
M_delta = 0.5726 %[s^-2]
x_cp = 121.2;  %[ft]
x_cg =  53.19; %[ft]
F = Tc;
% Other constants: Aircraft speed, platform area

Mach = 1.4; %mach
h = 34000; %height
S = 116.2; %platform area
Fbase = 1000; %base drag
Ca = 2.4; % coefficient
D = Ca*680*S -Fbase; %drag
Drag = 7.15*D; %total drag


% State space matrix

A_m  =[0 1 0; M_alpha 0 M_alpha/V; -(F-Drag+N_alpha)/m 0 -N_alpha/(m*V)];
B_m = [0; M_delta; Tc/m];
C_m = diag([1 1 1]);
D_m = [0;0;0];

pitch_ss = ss(A_m,B_m,C_m,D_m)




















