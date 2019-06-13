include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>
use <MCAD/shapes/cylinder.scad>
use <MCAD/fasteners/nuts_and_bolts.scad>

$fa = 1;
$fs = 0.1;

module trimplate(slice = 0.5) {
    difference() {
        translate(Z*1) {
            import ("plate.stl");
        }


        translate (Z * (4 - slice + epsilon)) {
            #ccube([30, 30, slice], center = X + Y);
        }
    }
}

//trimplate(0.5);

module pin() {
    difference() {
        union() {
            import("pin.stl");
            #mcad_rounded_cylinder(r = 2.85, h = 8.3, round_r = 0.75);
        }
        translate(Z * 5.8) {
            #hole();
            }
    }
}

module hole() {
    translate(Y * 3) {
        rotate(X * 90) {
            mcad_bolt_hole (2, 6, 0, proj = -1);
        }
    }
}
