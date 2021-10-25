

width_tripod_asm=24.52;
top_width=10.5;
total_ht=11;
thick=2;

translate([0,0,10])
cutout_tripod_mount_support(width_tripod_asm, top_width, total_ht, thick);




module cutout_tripod_mount_support(width_tripod_asm, top_width, total_ht, thick)
{
    translate([width_tripod_asm/2, thick/2, total_ht/4])
    {
cube([width_tripod_asm, 2, total_ht/2],true);

translate([0,0,total_ht/2])
cube([top_width, thick, total_ht/2],true);

translate([top_width/2, 1, total_ht/4])
rotate([90,0,0])
linear_extrude(thick)
polygon(points = [ [(width_tripod_asm-top_width)/2,0],[0,total_ht/2], [0,0]]);

translate([-top_width/2, -1, total_ht/4])
rotate([90,0,180])
linear_extrude(thick)
polygon(points = [ [(width_tripod_asm-top_width)/2,0],[0,total_ht/2], [0,0]]);
    }
}