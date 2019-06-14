include <phonering_include.scad>

module plateblank() {
    translate(Z * pltmid) {
        difference() {
            translate([-pltsze[0]/2, -pltsze[1]/2, -pltmid]) {
                mcad_rounded_box (pltsze,
                                  pltrnd,
                                  sidesonly = true,
                                  center = false);
            }
            ccube (cubesz,
                   center = X + Y);
        }
    }
}

module platecutout() {
    translate(Z * pltbot) {
        cylinder (r = pinbaserad + 0.2,
                   h = pltmid - pltbot + 0.2);
    }
    translate(Z * -epsilon) {
        cylinder (r = pinrad + 0.2,
                   h = pltbot + (epsilon * 2));
    }
}

module plate() {
    difference() {
        plateblank();
        platecutout();
    }
}
