function kp(R,n,z=0,i=0,angle=0) =
    [R*cos(360*i/n + angle),R*sin(360*i/n + angle),z];

function kfacet_a(R,n,z,i,alpha) = 
    [kp(R+thick_neg,n,z=0,i=i,angle=0),
     kp(R+thick_neg,n,z=z,i=i+1,angle=alpha),
     kp(R+thick_neg,n,z=z,i=i+2,angle=alpha),
     kp(R+thick_pos,n,z=0,i=i,angle=0),
     kp(R+thick_pos,n,z=z,i=i+1,angle=alpha),
     kp(R+thick_pos,n,z=z,i=i+2,angle=alpha)];

function kfacet_b(R,n,z,i,alpha) = 
    [kp(R+thick_neg,n,z=0,i=i,angle=0),
     kp(R+thick_neg,n,z=0,i=i+1,angle=0),
     kp(R+thick_neg,n,z=z,i=i+2,angle=alpha),
     kp(R+thick_pos,n,z=0,i=i,angle=0),
     kp(R+thick_pos,n,z=0,i=i+1,angle=0),
     kp(R+thick_pos,n,z=z,i=i+2,angle=alpha)];
     
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
thick_pos = 0.3; // positive, outward offset for thickness
thick_neg = -thick_pos; // negative, inward offset for thickness
                                        
z = 58;  // measured height

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));

// considering constant l
L2 = (l*l - z*z)/(4*R*R);
alpha = acos(1-2*L2)-360/n; // can be replaced by measured angle

for (i=[0:n-1]){
   plot_facet(kfacet_a(R,n,z,i,alpha));
   plot_facet(kfacet_b(R,n,z,i,alpha));
};


