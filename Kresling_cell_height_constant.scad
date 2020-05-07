include <Kresling.scad>

// Input parameters
R = 95.5; // Radius
n = 8;    // Number of sides
lambda = 0.5;
                                        
z = 250/4;  // measured height of one cell/stage

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));
a = 2*R*sin(180/n);
b = sqrt(l*l + a*a - 2*l*a*cos(lambda*theta));

echo(a = a);
echo(b = b);
echo(theta = theta);
echo(l = l);

alpha=acos(1-(l*l-z*z)/(2*R*R))-720/n; // considering constant l
//alpha=acos(1-(b*b-z*z)/(2*R*R))-360/n; // considering constant b

// draw tower
draw_kresling_tower(R,n,z,alpha,thickness=0.3,cells=1,
                    single_side=false,
                    facet_a=true,
                    facet_b=true);

