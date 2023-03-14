include <Kresling.scad>



// Input parameters
R = 30; // Radius
n = 8;    // Number of sides
lambda1 = 0.5;
lambda2 = 0.8;
lambda3 = 0.5;
         
theta = 90 * (1-2/n);

// Tower 1
l1 = 2*R*cos(theta*(1-lambda1));
max_angle1 = acos(1-l1*l1/(2*R*R))-720/n; // considering constant l
alpha1 = $t*max_angle1;// measured angle 
z1 = sqrt(l1*l1 - 2*R*R*(1 - cos(720/n + alpha1)));          

// draw tower
draw_kresling_tower(R,n,z1,alpha1,thickness = 1,cells=1,
                    single_side=false,
                    facet_a=true,
                    facet_b=true);
                    
// Tower 2
l2 = 2*R*cos(theta*(1-lambda2));
max_angle2 = acos(1-l2*l2/(2*R*R))-720/n; // considering constant l
alpha2 = $t*max_angle2;// measured angle 
z2 = sqrt(l2*l2 - 2*R*R*(1 - cos(720/n + alpha2)));          

// draw tower
rotate(a = [0,0,alpha1]) translate([0,0,z1])
    draw_kresling_tower(R,n,z2,alpha2,thickness = 1,cells=1,
                        single_side=false,
                        facet_a=true,
                        facet_b=true);
                    
// Tower 3
l3 = 2*R*cos(theta*(1-lambda3));
max_angle3 = acos(1-l3*l3/(2*R*R))-720/n; // considering constant l
alpha3 = $t*max_angle3;// measured angle 
z3 = sqrt(l3*l3 - 2*R*R*(1 - cos(720/n + alpha3)));          

// draw tower
rotate(a = [0,0,alpha2]) translate([0,0,z1+z2])
    draw_kresling_tower(R,n,z3,alpha3,thickness = 1.2,cells=1,
                        single_side=false,
                        facet_a=true,
                        facet_b=true);
                        
echo(z = z1+z2+z3);
echo(alpha = max_angle1 + max_angle2 + max_angle3);