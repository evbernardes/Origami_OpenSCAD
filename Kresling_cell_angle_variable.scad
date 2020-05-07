include <Kresling.scad>

// how to set up animation:
// Select "View -> Animate"
// "Time" will vary from 0 to 1. Set FPS and Steps to change
// How the animation goes

// Input parameters
R = 95.5; // Radius
n = 10;    // Number of sides
lambda = 0.5;

max_angle = 67;
alpha = $t*max_angle;// measured angle                                    
theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));

// considering constant l
z = sqrt(l*l - 2*R*R*(1 - cos(360/n + alpha)));                    

// draw tower
draw_kresling_tower(R,n,z,alpha,thickness = 0.3, no_of_cells=2);
