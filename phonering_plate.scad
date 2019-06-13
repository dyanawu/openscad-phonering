include <phonering_include.scad>

module trimplate(slice = 0.5) {
    difference() {
        translate(Z*1) {
            import ("plate.stl"); // original height = 4
        }
        translate (Z * (4 - slice + epsilon)) {
            ccube([30 + epsilon, 30 + epsilon, slice], center = X + Y);
        }
    }
}
