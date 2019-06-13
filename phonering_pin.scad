include <phonering_include.scad>

module pin(holesize = 2) {
    difference() {
        union() {
            import("pin.stl"); // original height = 8.3
            mcad_rounded_cylinder(r = 2.85, h = 8.3, round_r = 0.75);
        }
        translate(Z * 5.8) {
            pinhole(holesize);
        }
    }
}

module pinhole(holesize = 2) { // Either 2 or 3
    translate(Y * 3.5) {
        rotate(X * 90) {
            mcad_bolt_hole (holesize, 7, 0, proj = -1);
        }
    }
}
