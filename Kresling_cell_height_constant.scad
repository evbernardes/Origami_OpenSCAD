include <Kresling.scad>

// Input parameters
R = 95.5; // Radius
n = 8;    // Number of sides
lambda = 0.5;
                                        
z = 90;  // measured height of one cell/stage

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));

// considering constant l
L2 = (l*l - z*z)/(4*R*R);
alpha = acos(1-2*L2)-360/n; // can be replaced by measured angle

// draw tower
draw_kresling_tower(R,n,z,alpha,thickness = 10,no_of_cells=1,test=false);
