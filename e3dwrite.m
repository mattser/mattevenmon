% =========================================================================
% MATTEVENMON | E3DWRITE | MATTHEW SEREDYN | 2021
% =========================================================================
%
% Function that writes a series of folders and files for use with e3d. 
%                   ONLY WORKS ON A LINUX SYSTEM.
%
% Matthew Seredyn 2021

function e3dwrite(params)
    folder = sprintf('Event%d',params(1));
    system(sprintf('mkdir Event%d',params(1)));
    cd(folder);
    system(sprintf('touch event%d.in',params(1)));
    fname = sprintf('event%d.in',params(1));
     
    file = fopen(fname,'w');
    fprintf(file,'# Simple layered model simulating earthquake monitoring with a small local array\n');
    fprintf(file,'# x = east\n');
    fprintf(file,'# y = north\n');
    fprintf(file,'# z = z\n');
    fprintf(file,'\n');
    fprintf(file,'grid       z=3.5 x=5.0 y=5.0 dh=0.01 b=2 active=1\n');
    fprintf(file,'time       dt=0.0008  t=2500\n');
    
    fprintf(file,'source     type=4 freq=20');
    fprintf(file,' amp=%.2E',params(2));
    fprintf(file,' x=%d',params(3));
    fprintf(file,' y=%d',params(4));
    fprintf(file,' z=%d',params(5));
    fprintf(file,' Mxx=%d',params(6));
    fprintf(file,' Myy=%d',params(7));
    fprintf(file,' Mzz=%d',params(8));
    fprintf(file,' Mxy=%d',params(9));
    fprintf(file,' Mxz=%d',params(10));
    fprintf(file,' Myz=%d\n',params(11));
    fprintf(file,'\n');
    fprintf(file,'block	p=4.0 s=2.34 r=2.3\n');
    fprintf(file,'block        z2=0.032  p=3.2 s=2.0 r=2.3 \n');
    fprintf(file,'block    z1=0.184  z2=0.335  p=3.50 s=2.09 r=2.3 \n');
    fprintf(file,'block    z1=0.335  z2=0.483  p=3.40 s=2.00 r=2.3 \n');
    fprintf(file,'block    z1=0.483  z2=0.628  p=3.40 s=2.00 r=2.3 \n');
    fprintf(file,'block    z1=0.628  z2=0.771  p=3.66 s=2.19 r=2.3 \n');
    fprintf(file,'block    z1=0.771  z2=0.912  p=3.90 s=2.33 r=2.3 \n')
    fprintf(file,'block    z1=0.912  z2=1.053  p=4.27 s=2.55 r=2.3 \n');
    fprintf(file,'block    z1=1.053  z2=1.177  p=4.18 s=2.50 r=2.3 \n');
    fprintf(file,'block    z1=1.177  z2=1.234  p=4.27 s=2.41 r=2.3 \n');
    fprintf(file,'block    z1=1.234  z2=1.291  p=4.68 s=2.77 r=2.3 \n');
    fprintf(file,'block    z1=1.291  z2=1.345  p=4.71 s=2.85 r=2.3 \n');
    fprintf(file,'block    z1=1.345  z2=1.399  p=4.84 s=3.25 r=2.3 \n');
    fprintf(file,'block    z1=1.399  z2=1.452  p=4.79 s=2.96 r=2.3 \n');
    fprintf(file,'block    z1=1.452  z2=1.503  p=4.91 s=3.05 r=2.3 \n');
    fprintf(file,'block    z1=1.503  z2=1.568  p=4.89 s=3.06 r=2.3 \n');
    fprintf(file,'block    z1=1.568  z2=1.627  p=4.68 s=2.98 r=2.3 \n');
    fprintf(file,'block    z1=1.627  z2=1.678  p=4.72 s=3.12 r=2.3 \n');
    fprintf(file,'block    z1=1.678  z2=1.738  p=4.48 s=2.73 r=2.3 \n');
    fprintf(file,'block    z1=1.738  z2=1.797  p=4.46 s=2.67 r=2.3 \n');
    fprintf(file,'block    z1=1.797  z2=1.855  p=4.71 s=2.80 r=2.3 \n');
    fprintf(file,'block    z1=1.855  z2=1.905  p=5.09 s=2.99 r=2.3 \n');
    fprintf(file,'block    z1=1.905  z2=1.962  p=4.98 s=2.98 r=2.3 \n');
    fprintf(file,'block    z1=1.962  z2=2.027  p=4.89 s=2.96 r=2.3 \n');
    fprintf(file,'block    z1=2.027  z2=2.087  p=4.70 s=2.90 r=2.3 \n');
    fprintf(file,'block    z1=2.087  z2=2.157  p=4.52 s=2.78 r=2.3 \n');
    fprintf(file,'block    z1=2.157  z2=2.209  p=4.46 s=2.72 r=2.3 \n');
    fprintf(file,'block    z1=2.209  z2=2.271  p=4.76 s=2.77 r=2.3 \n'); %This block is the target bed
    fprintf(file,'block    z1=2.271  z2=2.328  p=4.81 s=2.68 r=2.3 \n');
    fprintf(file,'block    z1=2.328  z2=2.385  p=4.91 s=2.86 r=2.3 \n');
    fprintf(file,'block    z1=2.385  z2=2.445  p=4.78 s=2.68 r=2.3 \n');
    fprintf(file,'block    z1=2.445  z2=2.508  p=5.12 s=2.85 r=2.3 \n');
    fprintf(file,'block    z1=2.508  z2=2.621  p=4.52 s=2.67 r=2.3 \n');
    fprintf(file,'block    z1=2.621  z2=2.771  p=4.74 s=2.77 r=2.3 \n');
    fprintf(file,'block    z1=2.771  z2=2.921  p=4.91 s=2.89 r=2.3 \n');
    fprintf(file,'block    z1=2.921  z2=3.071  p=4.74 s=2.80 r=2.3 \n');
    fprintf(file,'block    z1=3.071  z2=3.221  p=4.74 s=2.60 r=2.3 \n');
    fprintf(file,'block    z1=3.221  z2=3.371  p=4.97 s=2.71 r=2.3 \n');
    fprintf(file,'block    z1=3.371            p=4.57 s=2.68 r=2.3 \n');
    fprintf(file,'\n');
    fprintf(file,'# Surface array\n');
    fprintf(file,"sac z=0.0 x=2.5 y=2.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=1.5 y=2.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=3.5 y=2.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=2.5 y=1.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=2.5 y=3.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=1.0 y=1.0 file='data'\n");
    fprintf(file,"sac z=0.0 x=1.0 y=4.0 file='data'\n");
    fprintf(file,"sac z=0.0 x=4.0 y=4.0 file='data'\n");
    fprintf(file,"sac z=0.0 x=4.0 y=1.0 file='data'\n");
    fprintf(file,"sac z=0.0 x=0.5 y=2.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=2.5 y=0.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=2.5 y=4.5 file='data'\n");
    fprintf(file,"sac z=0.0 x=4.5 y=2.5 file='data'\n");
    
    fclose(file);
    
    cd ../
end
% =========================================================================
%                           End of Code