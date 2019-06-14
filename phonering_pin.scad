include <phonering_include.scad>

module pinblank() {
    union() {
        cylinder (r = pinbaserad,
                  h = pinbasehei);
        mcad_rounded_cylinder (r = pinrad,
                               h = pinhei,
                               round_r = pinrnd);
    }
}

module pinhole() {
    rotate(X * -90) {
        mcad_bolt_hole (screw,
                        (pinrad * 2) + 2,
                        0,
                        proj = -1);
    }
}

module place_pinhole() {
    translate([0, -pinrad - 1, pinhei - holeoffset]) {
        pinhole();
    }
}

module pin() {
    difference() {
        pinblank();
        place_pinhole();
    }
}
