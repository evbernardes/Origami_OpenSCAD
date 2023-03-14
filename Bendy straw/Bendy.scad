thick_face = 0.001;

module draw_cone(R,r,h,thick_out,thick_in,thick_face,fn){
    difference(){
    cylinder(h=h, r1=r+thick_out, r2=R+thick_out, center=false, $fn=fn);
    cylinder(h=h, r1=r-thick_in, r2=R-thick_in, center=false, $fn=fn);
    translate([0,0,h-thick_face]) cylinder(h=thick_face*2, r1=R, r2=R, center=false, $fn=fn);
    translate([0,0,-thick_face]) cylinder(h=thick_out, r1=r, r2=r, center=false, $fn=fn);
    }
}

module draw_cell(R,r,h1,h2,thick_out,thick_in,thick_face,fn){
   translate([0,0,h2]) union(){
       //color([1, 0, 0]) 
       draw_cone(R,r,h1,thick_out,thick_in,thick_face,fn);
       //color([0, 0, 1])
       rotate([180,0,0])  draw_cone(R,r,h2,thick_out,thick_in,thick_face,fn);
   } 
}

module draw_tower(R,r,h1,h2,h_base,h_dist,n,fn,thick_out,thick_in){
    union(){
    // bottom base
    draw_cone(R,R,h_base,thick_out,thick_in,thick_face,fn);
    
    // cell    
    for(i=[0:1:n-1])
        translate([0,0,h_base + i*(h1+h2+h_dist)]) draw_cell(R,r,h1,h2,thick_out,thick_in,thick_face,fn);
    
    // cell connectors
    for(i=[1:n-1])
        translate([0,0,h_base + i*(h1+h2)+(i-1)*h_dist]) draw_cone(R,R,h_dist,thick_out,thick_in,thick_face,fn);
    
    // top base
    translate([0,0,h_base + n*(h1+h2)+(n-1)*h_dist]) draw_cone(R,R,h_base,thick_out,thick_in,thick_face, fn);
    }
}

//draw_cell(R,r,h1,h2,thick_out,thick_in,thick_face);
//for 