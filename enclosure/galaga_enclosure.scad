//
// Galaga Enclosure
//

// Render modes
//   1 raw_case_side
//   2 button_bezel
//   3 lcd_bezel
//   4 rear_panel
//   5 base
//   6 lid
//   7 case_side
//   8 all_together (one side + all other walls)
//
render_mode = 8;


module raw_case_side() {
    linear_extrude(height=2, center=false, convexity=10) {
        import(file = "case_side.svg", center=false, dpi=72);
    }
}


// PCB: 70 x 50 -> 72 x 58 (2 extra at lcd_bezel end);  Holes: 1.25 + 0.5*2.5 = 2.5
module button_bezel(slot_extra) {
    difference() {
        union() {
            cube([72, 58, 2]);
            
            // mounting tabs
            translate([-2.5, 7 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            translate([-2.5, 39 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            // Stand-offs
            translate([3.5, 5.5, 0]) {
                cylinder(r=3, h=2+8.2, $fn=120);
            }
            
            translate([72 - 3.5, 5.5, 0]) {
                cylinder(r=3, h=2+8.2, $fn=120);
            }
            
            translate([3.5, 55 - 3.5, 0]) {
                cylinder(r=3, h=2+8.2, $fn=120);
            }
            
            translate([72 - 3.5, 55 - 3.5, 0]) {
                cylinder(r=3, h=2+8.2, $fn=120);
            }
        }
        
        // screw holes
        translate([3.5, 5.5, 2]) {
            cylinder(r=0.9, h=2+ 8.3, $fn=120);
        }
        
         translate([72 - 3.5, 5.5, 2]) {
            cylinder(r=0.9, h=2+ 8.3, $fn=120);
        }
        
         translate([3.5, 55 - 3.5, 2]) {
            cylinder(r=0.9, h=2+ 8.3, $fn=120);
        }
        
         translate([72 - 3.5, 55 - 3.5, 2]) {
            cylinder(r=0.9, h=2+ 8.3, $fn=120);
        }
        
        // Button holes
        translate([14.32, 16, -0.1]) {
            cylinder(r=6, h=2.2, $fn=120);
        }
        
        translate([42.26, 16, -0.1]) {
            cylinder(r=6, h=2.2, $fn=120);
        }
        
        translate([57.5, 16, -0.1]) {
            cylinder(r=6, h=2.2, $fn=120);
        }
        
        translate([24.5, 38.86, -0.1]) {
            cylinder(r=6, h=2.2, $fn=120);
        }
        
        translate([47.36, 38.86, -0.1]) {
            cylinder(r=6, h=2.2, $fn=120);
        }
    }
}


// bezel: 72 x 102 (2 extra at top); lcd cutout: 52 x 76.5;
// lcd cutout x0  = 72/2 - 52/2 = 10
// lcd cutout y0 = 100/2 - 76.5/2 = 11.75
// screw x0 = 72/2 - 25 - 8.2 + 2.5 = 5.3
// screw y0 = 100/2 - 37.25 - 12.5 + 2.5 = 2.75
// 
module lcd_bezel(slot_extra) {
    difference() {
        union() {
            cube([72, 102, 2]);
            
            // Mounting tabs
            translate([-2.5, 10 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            translate([-2.5, 100 - 20 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            // Stand-offs
            translate([5.3, 2.75, 0]) {
                cylinder(r=2.5, h=6, $fn=120);
            }
            
            translate([5.3 + 64, 2.75, 0]) {
                cylinder(r=2.5, h=6, $fn=120);
            }
            
             translate([5.3, 2.75 + 90, 0]) {
                cylinder(r=2.5, h=6, $fn=120);
            }
            
            translate([5.3 + 64, 2.75 + 90, 0]) {
                cylinder(r=2.5, h=6, $fn=120);
            }
        }
        
        // Screw holes
        translate([5.3, 2.75, 1]) {
            cylinder(r=1.25, h=5.1, $fn=120);
        }
        
         translate([5.3 + 64, 2.75, 1]) {
            cylinder(r=1.25, h=5.1, $fn=120);
        }
        
        translate([5.3, 2.75 + 90, 1]) {
            cylinder(r=1.25, h=5.1, $fn=120);
        }
        
         translate([5.3 + 64, 2.75 + 90, 1]) {
            cylinder(r=1.25, h=5.1, $fn=120);
        }
        
        // LCD cutout
        translate([10, 11.75, -0.1]) {
            cube([52, 76.5, 2.2]);
        }
    }
}


// 70 x 139.7 (-2 at top)
module rear_panel(slot_extra) {
    difference() {
        union() {
            cube([72, 137.7, 2]);
            
            // Mounting tabs
            translate([-2.5, 139.7/4 - 5 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            translate([-2.5, 139.7/2 - 5 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            translate([-2.5, 3*139.7/4 - 5 - slot_extra, 0 - slot_extra]) {
                cube([77, 10 + 2*slot_extra, 2 + 2*slot_extra]);
            }
            
            // Speaker holder positive component
            translate([72/2, 90, 0]) {
                cylinder(d=43.25, h=4, $fn=120);
            }
        }
        
        // Power Button
        translate([21, 30, -0.1]) {
            cylinder(d=12.5, h=2.2, $fn=120);
        }
        
        // USB connector (14 x 5.5)
        translate([70 - 21 - 14/2, 30 - 5.5/2, -0.1]) {
            cube([14, 5.5, 2.2]);
        }
        
        // Speaker holder negative component
        translate([72/2, 90, 2]) {
            cylinder(d=40.25, h=4, $fn=120);
        }
        
        // Speaker grill
        translate([22, 90 - 10/2, 1]) {
            rotate([-90, 0, 0]) {
                cylinder(d=3, h=10, $fn=30);
            }
        }
        
        translate([29, 90 - 20/2, 1]) {
            rotate([-90, 0, 0]) {
                cylinder(d=3, h=20, $fn=30);
            }
        }
        
        translate([36, 90- 30/2, 1]) {
            rotate([-90, 0, 0]) {
                cylinder(d=3, h=30, $fn=30);
            }
        }
        
        translate([43, 90 - 20/2, 1]) {
            rotate([-90, 0, 0]) {
                cylinder(d=3, h=20, $fn=30);
            }
        }
        
        translate([50, 90 - 10/2, 1]) {
            rotate([-90, 0, 0]) {
                cylinder(d=3, h=10, $fn=30);
            }
        }
        
        // Speaker power switch
        // 15 between 2.75 diameter holes; 7x4.25 cutout
        translate([(72 - 7)/2, 60, -0.1]) {
            cube([7, 4.25, 2.2]);
        }
        
        translate([(72 - 15)/2, 62.125, -0.1]) {
            cylinder(d=2.5, h=2.2, $fn=120);
        }
        
        translate([(72 + 15)/2, 62.125, -0.1]) {
            cylinder(d=2.5, h=2.2, $fn=120);
        }
    }
}


// bottom: 72 x (122-4) x 2
// front face: 70 x 19.05 x 2
module base() {
    difference() {
        union() {
            // bottom
            cube([72, 122 - 4, 2]);
            
            // front face
            cube([72, 2, 19]);
            
            // mounting blocks
            translate([0, 25, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([0, 86, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([72 - 10, 25, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([72 - 10, 86, 0]) {
                cube([10, 10, 7]);
            }
        }
        
        // screw holes
        translate([-0.1, 25 + 5, 4]) {
            rotate([0, 90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([-0.1, 86 + 5, 4]) {
            rotate([0, 90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([72.1, 25 + 5, 4]) {
            rotate([0, -90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([72.1, 86 + 5, 4]) {
            rotate([0, -90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
    }
}


// top: 72 x 43.8
// front face: 70 x 12.7
module lid() {
    difference() {
        union() {
            // top
            cube([72, 43.8, 2]);
            
            // front face
            cube([72, 2, 12.7]);
            
            // mounting blocks
            translate([0, 2, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([0, 43.8 - 10 - 4, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([72 - 10, 2, 0]) {
                cube([10, 10, 7]);
            }
            
            translate([72 - 10, 43.8 - 10 - 4, 0]) {
                cube([10, 10, 7]);
            }
        }
        
        // screw holes
        translate([-0.1, 2 + 5, 4]) {
            rotate([0, 90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([-0.1, 43.8 - 10 - 4 + 5, 4]) {
            rotate([0, 90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([72.1, 2 + 5, 4]) {
            rotate([0, -90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
        
        translate([72.1, 43.8 - 10 - 4 + 5, 4]) {
            rotate([0, -90, 0]) {
                cylinder(r=1.25, h=8, $fn=60);
            }
        }
    }
}


module case_side() {
    difference() {
        raw_case_side();
        
        // button_bezel
        translate([2.5, 18, 74]) {
            rotate([0, 90, -75]) {
                #button_bezel(0.1);
            }
        }
        
        // LCD bezel
        translate([59.5, 33.5, 74]) {
            rotate([0, 90, -23]) {
                #lcd_bezel(0.1);
            }
        }
        
        // Rear panel
        translate([120, 0, 2]) {
            rotate([0, 270, 0]) {
                #rear_panel(0.1);
            }
        }
        
        // Bottom screw holes
        translate([25 + 5, 4, -0.1]) {
            cylinder(r=1.25, h=2.2, $fn=60);
        }
        
        translate([86 + 5, 4, -0.1]) {
            cylinder(r=1.25, h=2.2, $fn=60);
        }
        
        // Top screw holes
        translate([122 - 43.8 + 2 + 5, 139.7 - 4, -0.1]) {
            cylinder(r=1.25, h=2.2, $fn=60);
        }
        
        translate([122 - 10 - 4 + 5, 139.7 - 4, -0.1]) {
            cylinder(r=1.25, h=2.2, $fn=60);
        }
    }
}


module all_together() {
    case_side();
    
    // Base
    translate([0, 0, 2]) {
        rotate([0, -90, -90]) {
            base();
        }
    }
    
    // Lid
    translate([122 - 43.8, 139.9, 74]) {
        rotate([0, 90, -90]) {
            lid();
        }
    }
}



if (render_mode == 1) {
    raw_case_side();
}

if (render_mode == 2) {
    button_bezel(0);
}

if (render_mode == 3) {
    lcd_bezel(0);
}

if (render_mode == 4) {
    rear_panel(0);
}

if (render_mode == 5) {
    base();
}

if (render_mode == 6) {
    lid();
}

if (render_mode == 7) {
    case_side();
}

if (render_mode == 8) {
    all_together();
}
