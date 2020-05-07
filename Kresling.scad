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