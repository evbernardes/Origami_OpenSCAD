include <Kresling.scad>

// how to set up animation:
// Select "View -> Animate"
// "Time" will vary from 0 to 1. Set FPS and Steps to change
// How the animation goes

// Input parameters
R = 95.5; // Radius
n = 8;    // Number of sides
lambda = 0.5;
thick_pos = 0.03; // positive, outward offset for thickness
thick_neg = -thick_pos; // negative, inward offset for thickness

max_angle = 67;
alpha = $t*max_angle; // measured angle                                    
no_of_cells = 2; // number of cells/stages

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));

// considering constant l
z = sqrt(l*l - 2*R*R*(1 - cos(360/n + alpha)));                    

for (cell=[1:no_of_cells]){
    for (i=[0:n-1]){
       plot_facet(kfacet_a(R,n,z,i,alpha,cell=cell));
       plot_facet(kfacet_b(R,n,z,i,alpha,cell=cell));
    };
};


