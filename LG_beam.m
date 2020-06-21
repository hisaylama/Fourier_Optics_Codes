%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Evaluate Laguerre Gauss beam for symboli function
%E_lp (rho, phi)
%rho^2 = (x^2 + y^2)
%l,p is node and order
%Amplitude = 1 (say)
%Beam waist = 0.5 - 1(unit)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all,
clear
clc
l = input('number of nodes along the radial direction -- ');
p = input('phase singularity order -- ');
w = input('beam waist -- ');
xx = -10:0.05:10;
yy = -10:0.05:10;
[x,y] = meshgrid(xx,yy);
z = (x.^2 + y.^2)./(w^2);
L = laguerreL(p,l,2.*z);
c = sqrt(factorial(p)./(3.14.*factorial(abs(l)+p)));
Phi = abs(l).*atan2(y,x);
u_in = c.*((sqrt(2).*sqrt(z)).^abs(l)).*L.*exp(-z).*exp(1j.*Phi);
%L_Gp = u_in.*conj(u_in);
L_Gp = abs(u_in);
Phase = angle(u_in);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
xlabel('E(x,y)')
xlim([1 length(xx)]);ylim([1 length(yy)]);
surface(L_Gp)
%surf(xx,yy,zz, L_Gp)
axis equal
colormap(gray)
colorbar()
shading interp 
axis off

figure(2)
xlabel('Phase')
xlim([1 length(xx)]);ylim([1 length(yy)]);
surface(Phase)
colormap(gray)
colorbar()
shading interp 
axis off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
