include <phonering_include.scad>

module ring() {
    translate(Z * (ringthick/2)) {
        difference() {
            union() {
                ring_outer();
                place_block();
            }
    
            place_bolthole();
            place_pin_gap();
        }
    }
}

assembled = 1; // 0 = arrange for printing, 1 = arrange as assembled

if (assembled == 1) {
    translate(Z * 3) {
        rotate(Y * 180) {
            trimplate(slice);
        }
    }
    rotate(Z * 90) {
        pin(holesize);
    }
translate([0, ringthick / 2, (ringrad + 5.5)]) {
    rotate(X * 90) {
        ring();
    }
    }
} else {
    translate (X * 40) {
        trimplate(slice);
    }
    translate ([15, 20, 0]) {
        pin(holesize);
    }
    ring();
}
