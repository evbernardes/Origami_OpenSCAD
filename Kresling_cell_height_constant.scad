include <Kresling.scad>

// Input parameters
R = 95.5; // Radius
n = 8;    // Number of sides
lambda = 0.5;
thick_pos = 0.03; // positive, outward offset for thickness
thick_neg = -thick_pos; // negative, inward offset for thickness
                                        
z = 90;  // measured height of one cell/stage
no_of_cells = 1; // number of cells/stages

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));

// considering constant l
L2 = (l*l - z*z)/(4*R*R);
alpha = acos(1-2*L2)-360/n; // can be replaced by measured angle

for (cell=[1:no_of_cells]){
    for (i=[0:n-1]){
       plot_facet(kfacet_a(R,n,z,i,alpha,cell=cell));
       plot_facet(kfacet_b(R,n,z,i,alpha,cell=cell));
    };
};


