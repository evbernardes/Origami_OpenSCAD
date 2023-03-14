include <Bendy.scad>

// Input parameters
R = 25.0; // Radius
ratio = 0.5; // ratio between inner and outer radius
alpha1 = 45; // angle of top cone
alpha2 = 35; // angle of bottom cone

// number of cells
n = 1;

r = ratio*R;
h1 = (R-r)*tan(alpha1);
h2 = (R-r)*tan(alpha2);

// thickness = thick_out + thick_in
thick_out = 1.0;
thick_in = 0.0;

// optional parameters, 
h_base = 0.0; // extra cylinders on top and bottom of tower
h_dist = 0.0; // extra cylinders between cells

// circular approximation
// setting it to a large value (25, for example) creates
// a good circular approximation.
// setting it to a lower value (6 or 8, for example) creates
// something closer to the origami bendy tower
fn = 8;

// draw tower
draw_tower(R,r,h1,h2,h_base,h_dist,n,fn,thick_out,thick_in);

//$vpr = [90+alpha1, 0, 180/fn];
//$vpr = [90, 0, 180/fn];
//$vpr = [90, 0, 180/fn];
//$vpt = [0,0,h2];
//$vpd = 150;