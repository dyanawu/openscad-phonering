include <phonering_include.scad>

module ring_outer() {
    rotate_extrude() {
        translate([ringrad,0,0]) {
            roundedSquare([ringthick, ringthick], ringrnd);
        }
    }
}

module blockblank() {
    rotate (Y * 90) {
        linear_extrude (height = blklen) {
            roundedSquare ([ringthick + 0.5, ringthick + 1], ringrnd);
        }
    }
}

module place_block() {
    translate([-blklen / 2, -ringrad, 0]) {
        blockblank();
    }
}

module screwhole() {
    rotate(Z * 30) {
        mcad_bolt_hole_with_nut (size = screw,
                                 length = screwlen,
                                 screw_extra_length = 1,
                                 head_extra_length = 1,
                                 nut_projection_length = 1);
    }
}

module place_screwhole() {
    translate([blklen / 2, -ringrad, 0]) {
        rotate(Y * -90) {
            screwhole();
        }
    }
}

module pin_gap() {
    cube([(pinrad * 2) + 0.5, ringthick + (ringrnd * 2), ringthick + (ringrnd * 2)], center = true);
}

module place_pin_gap() {
    translate(Y * (-ringrad)) {
        pin_gap();
    }
}

module ring() {
    translate(Z * (ringthick / 2)) {
        difference() {
            union() {
                ring_outer();
				place_block();
            }

            place_screwhole();
            place_pin_gap();
        }
    }
}
