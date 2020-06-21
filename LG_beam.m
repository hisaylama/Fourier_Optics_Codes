%Lagueree Gaussian Beam 
clear all, close all,
clc
M = 600; %X-axis (px)
N = 600; %Y-axis (px)
dx1=1; %src sample interval
x1=1:1:M; %src coords
y1=1:1:N;
lambda=1064*10^-9; %wavelength
k=2*pi/lambda; %wavenumber
z=2000; %propagation dist (px)
[X1,Y1]=meshgrid(x1,y1);
r = sqrt(x1.^2 + y1.^2);
p = 1;
l=1;
w=500; %source half width (px)
u_in = LG_beam_fun(p,l,w);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x
w=500; %source half width (px)
