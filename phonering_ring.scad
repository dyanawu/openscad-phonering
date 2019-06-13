include <phonering_include.scad>

module ring_outer() {
    rotate_extrude() {
        translate([ringrad,0,0]) {
            roundedSquare([ringthick, ringthick], 0.75);
        }
    }
}

module block() {
    rotate(Y * 90) {
        mcad_rounded_box([ringthick, ringthick, blocklength], 2, sidesonly = false, center = true);
    }
}

module place_block() {
    translate(Y * -ringrad) {
        ring_block();
    }
}

module bolthole() {
    mcad_bolt_hole_with_nut (size = 2,
                             length = (blocklength - 2 - 2.8),
                             screw_extra_length = 1,
                             head_extra_length = 1,
                             nut_projection_length = 1.75);
}

module place_bolthole(){
    translate([-(blocklength / 2), -ringrad + 0.25, 0]) {
        rotate(Y * 90) {
            rotate(Z * 30) {
                bolthole();
            }
        }
    }
}

module pin_gap() {
    cube([6, ringthick * 1.5, ringthick * 1.5], center = true);
}

module place_pin_gap() {
    translate(Y * - ringrad) {
        pin_gap();
    }
}
