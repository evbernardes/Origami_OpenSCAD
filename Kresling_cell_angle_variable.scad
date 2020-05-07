function kp(R,n,z=0,i=0,angle=0,cell = 1) =
    [R*cos(360*i/n + angle),R*sin(360*i/n + angle),z*(cell)];

function kfacet_a(R,n,z,i,alpha,cell = 1) = 
    [kp(R+thick_neg,n,z=z*(cell-1),i=i,angle=alpha*(cell-1)),
     kp(R+thick_neg,n,z=z*cell,i=i+1,angle=alpha*cell),
     kp(R+thick_neg,n,z=z*cell,i=i+2,angle=alpha*cell),
     kp(R+thick_pos,n,z=z*(cell-1),i=i,angle=alpha*(cell-1)),
     kp(R+thick_pos,n,z=z*cell,i=i+1,angle=alpha*cell),
     kp(R+thick_pos,n,z=z*cell,i=i+2,angle=alpha*cell)];

function kfacet_b(R,n,z,i,alpha,cell = 1) = 
    [kp(R+thick_neg,n,z=z*(cell-1),i=i,angle=alpha*(cell-1)),
     kp(R+thick_neg,n,z=z*(cell-1),i=i+1,angle=alpha*(cell-1)),
     kp(R+thick_neg,n,z=z*cell,i=i+2,angle=alpha*cell),
     kp(R+thick_pos,n,z=z*(cell-1),i=i,angle=alpha*(cell-1)),
     kp(R+thick_pos,n,z=z*(cell-1),i=i+1,angle=alpha*(cell-1)),
     kp(R+thick_pos,n,z=z*cell,i=i+2,angle=alpha*cell)];
     
module plot_facet(F)
    {polyhedron(points=[F[0],F[1],F[2],F[3],F[4],F[5]],
           faces = [[1,2,3],
                    [4,5,6],
                    [1,4,6,3],
                    [1,4,5,2],
                    [2,5,6,3]]);};

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


