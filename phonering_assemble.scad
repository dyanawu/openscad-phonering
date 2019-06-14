include <phonering_include.scad>

assembled = 1; // 0 = arrange for printing, 1 = arrange as assembled

if (assembled == 1) {
    translate(Z * 3) {
        rotate(Y * 180) {
            plate();
        }
    }
    rotate(Z * 90) {
    pin();
    }
    
    translate([0, ringthick / 2, ringrad + (pinhei - holeoffset)]) {
        rotate(X * 90) {
            ring();
        }
    }
}

else {
    translate (X * 40) {
        plate();
    }
    translate ([17.5, 20, 0]) {
        pin();
    }
    ring();
}
