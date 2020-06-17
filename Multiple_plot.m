 %code for creating the multiple circular spots in the 2D plane in the maltab
 %author - Hisay Lama
 %email:hisaylama@gmail.com
 %spacing betwwen the dots = L/10
 %I = irradiance
 %size of the lattice (i,j) = (4,4)
 %size of the frame = [L/2, L/2 - dx]
 clear, close all,
 clc
 L=50; %side length (px)
 M=250; %number of samples
 dx1=L/M; %src sample interval
 x1=-L/2:dx1:L/2-dx1; %src coords
 y1=x1;
 w=0.1; %half width of the spot (px) 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%Adding the input circle function
 
 [X1,Y1]=meshgrid(x1,y1);
 I1 = 0;
 for i = 1:1:4
     I = 0;
     for j = 1:1:4
         u1=circ((sqrt((X1-i.*L/10).^2 + (Y1 - j.*L/10).^2))./w);
         I = I + abs(u1.^2); 
     end
   I1= I1 + I;  
  end
 figure(1)
 imagesc(x1,y1,I1);
 axis square; axis xy;
 colormap('gray'); xlabel('x (px)'); ylabel('y (px)');
 title('z= 0 px');