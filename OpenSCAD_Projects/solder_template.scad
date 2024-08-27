// smoother cylinders
$fn=100;

outer_h_dim = [22, 26.5, 5];
outer_w_dim = [26.5, 22, 5];
trimmed_dimensions = [25, 25, 5];
mounting_hole_top = cylinder(5, 1.1, 1.1);
mounting_hole_bottom = cylinder(5, 1.1, 1.1);
bottom_notch_dimension = [17 + 2, 2 + 1, 7];
bottom_notch_offset = [30-16, -1, -.5];

mounting_hole_center_top_offset = [1.7, 37-1.28, 0];
rp2040_center_offset_mounting_hole = [14.9, -14.35, 2];

difference() {
// create the base object
difference() {
    cube([32, 37, 1]);
    // notch out the bottom
    translate(bottom_notch_offset) {
        cube(bottom_notch_dimension);
    }
}

// notch out the rp2040 stamp
translate(mounting_hole_center_top_offset + rp2040_center_offset_mounting_hole) {
    cube(outer_h_dim, center=true);
    cube(outer_w_dim, center=true);
    cube(trimmed_dimensions, center=true);
}

}


translate([1.7, 37-1.28, -.5]) {
// add out the top hole
cylinder(1, 1.1, 1.1, center=true);
}

translate(mounting_hole_center_top_offset + [2.5, -33.5, -.5]) {
    cylinder(1, 1.1, 1.1, center=true);
}
