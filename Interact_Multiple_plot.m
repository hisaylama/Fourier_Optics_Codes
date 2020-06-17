%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%code for creating the multiple circular spots in the 2D plane in the maltab
 %author - Hisay Lama
 %email - hisaylama@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 %Specification --
 %spacing betwwen the dots = L/10
 %I = irradiance
 %size of the lattice S_L(i,j) = (4,4)
 %size of the frame = [L/2, L/2 - dx]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 clear, close all,
 clc
 %M = 800; %size along Y (pixel)
 M = input('Enter the Y_max in pixel -- ');
 %N = 600; %size along X (pixel)
 N = input('Enter the X_max in pixel --');
 %S_L = 6; %Number of spots 
 S_L = input('Enter the number of spots --');
 %P = 40; %spacing between the spots
 P = input('Enter the inter-spot separation in pixel --');
 dx1=1; %src sample interval (pixel)
 x1=-N/2:dx1:N/2; %src coords
 y1 =-M/2:dx1:M/2 ;
 w=2.5; %half width of the spot (px) 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%Adding the input circle function
 [X1,Y1]=meshgrid(x1,y1);
 I1 = 0;

 for i = 1:1:S_L
     I = 0;
     for j = 1:1:S_L
         u1=circ((sqrt((X1-i.*P).^2 + (Y1 - j.*P).^2))./w);
         I = I + abs(u1.^2); 
     end
   I1= I1 + I;  
  end
 figure(1)
 imagesc(x1,y1,I1);
 axis square; axis xy;
 colormap('gray'); xlabel('x (px)'); ylabel('y (px)');
 title('z= 0 px');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%