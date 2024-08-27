// made the cylinders at least somewhat round.
$fa = 1;
$fs = 0.5;

board_mount_start_x = 15.25;
board_mount_start_y = 14;
hole_mount_radius = 1.1;
hole_mount_height = 5;

difference() {
linear_extrude(height=15)
    polygon(points=[[0, 0], [55, 0], [49.25, 35], [5.75, 35]], paths=1);
    translate([10, 0, 0])
    cube([6, 5, 10]);
    translate([39, 0, 0])
    cube([6, 5, 10]);
    // channel for cables
    translate([24, 0, 0])
    cube([7, 100, 2]);
    // slant for receiver board
    translate([0, 0, 4])
    rotate([5, 0, 0])
    difference() {
        cube([200, 200, 200]);
        translate([board_mount_start_x, board_mount_start_y+15.5, 0])
            cylinder(r=hole_mount_radius, h=hole_mount_height);
        translate([board_mount_start_x+24.5, board_mount_start_y+15.5, 0])
            cylinder(r=hole_mount_radius, h=hole_mount_height);
        translate([board_mount_start_x+24.5, board_mount_start_y, 0])
            cylinder(r=hole_mount_radius, h=hole_mount_height);
    }
}