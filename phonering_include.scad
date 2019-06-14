include <MCAD/units/metric.scad>
use <MCAD/shapes/3Dshapes.scad>
use <MCAD/shapes/2Dshapes.scad>
use <MCAD/shapes/cylinder.scad>
use <MCAD/fasteners/nuts_and_bolts.scad>
use <phonering_plate.scad>
use <phonering_pin.scad>
use <phonering_ring.scad>

$fa = 1;
$fs = 0.1;

//generic
screw = 2; //metric screw size to use

//pin
pinbaserad = 6;
pinbasehei = 1.25;
pinrad = 3;
pinhei = 9;
pinrnd = pinrad * 0.2;
holeoffset = 2.5;

//plate
pltsze = [30,30,3.5];
pltbrd = 2;
pltmid = pinbasehei * 2;
pltbot = pinbasehei - 0.25;
pltrnd = min(pltsze[0], pltsze[1]) * 0.05;
cubesz = [pltsze[0] - pltbrd, pltsze[1] - pltbrd, pltsze[2] - pltbot + epsilon];

//ring
ringthick = 5;
ringrad = 13.5;
ringrnd = 0.75;
blklen = 21;
blkrnd = blklen * 0.1;
screwlen = blklen - 2 - 2.8;
