function kresling_point(R,n,z=0,i=0,angle=0) =
    [R*cos(360*i/n + angle),R*sin(360*i/n + angle),z];

function facet_a_points(R,n,z,i,alpha) = 
    [kresling_point(R,n,z=0,i=i,angle=0),
     kresling_point(R,n,z=z,i=i+1,angle=alpha),
     kresling_point(R,n,z=z,i=i+2,angle=alpha)];

function facet_b_points(R,n,z,i,alpha) = 
    [kresling_point(R,n,z=0,i=i,angle=0),
     kresling_point(R,n,z=0,i=i+1,angle=0),
     kresling_point(R,n,z=z,i=i+2,angle=alpha)];
     
module draw_facet(F){
    polyhedron(points=[F[0],F[1],F[2],F[0],F[1],F[2]],
           faces = [[1,3,2],
                    [4,6,5],
                    [1,3,6,4],
                    [1,2,5,4],
                    [2,3,6,5]]);};

module draw_kresling_tower(R,n,z,alpha,thickness=0.3,cells=1,single_side=false,facet_a=true,facet_b=true){
    
    for (cell=[1:cells]){
        rotate([0, 0, alpha*(cell-1)]) translate([0,0,z*(cell-1)])
        for (i=[0:single_side ? 0 : n-1]){
           if(facet_a){
               hull(){
                    draw_facet(facet_a_points(R-thickness/2,n,z,i,alpha));
                    draw_facet(facet_a_points(R+thickness/2,n,z,i,alpha));
               };};
           if(facet_b){
               hull(){
                    draw_facet(facet_b_points(R-thickness/2,n,z,i,alpha));
                    draw_facet(facet_b_points(R+thickness/2,n,z,i,alpha));
               };};
        };
    };
}

//// Input parameters
//R = 95.5; // Radius
//n = 8;    // Number of sides
//lambda = 0.5;
//
//alpha = 10; // measured angle
//
//theta = 90 * (1-2/n);
//l = 2*R*cos(theta*(1-lambda));
//
//// considering constant l
//z = sqrt(l*l - 2*R*R*(1 - cos(360/n + alpha)));
//
//// draw tower
//draw_kresling_tower(R,n,z,alpha,thickness = 0.3,no_of_cells=1,single_side=false,facet_a=true,facet_b=true);