include <Kresling.scad>

// Input parameters
R = 95.5; // Radius
n = 8;    // Number of sides
lambda = 0.5;

theta = 90 * (1-2/n);
l = 2*R*cos(theta*(1-lambda));
a = 2*R*sin(180/n);
b = sqrt(l*l + a*a - 2*l*a*cos(lambda*theta));

echo(a = a);
echo(b = b);
echo(theta = theta);
echo(l = l);

alpha = 0; // measured angle

//z = sqrt(l*l - 2*R*R*(1 - cos(360/n + alpha))); // considering constant l
z = sqrt(b*b - 2*R*R*(1 - cos(360/n + alpha))); // considering constant b

// draw tower
draw_kresling_tower(R,n,z,alpha,thickness = 0.3,cells=1,single_side=false,facet_a=true,facet_b=true);

