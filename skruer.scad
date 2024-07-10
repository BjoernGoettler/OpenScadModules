/*
    This is only for testing modularization of OpenSCAD User Defined stuff
    
    It assumes that screws are to be placed perpendicular to af surface following the X-axis
*/

default_rotation = [90,0,0];

module skruehul(laengde, diameter)
{
    rotate(default_rotation) cylinder(laengde, d=diameter, center=true);
    
}

module fordybning()
{
    rotate(default_rotation) cylinder(forsaenkning, d=skruehoved, center=true);
}

module skrue(skruelaengde, skruediameter, forsaenkning, forsaenkningdiameter)
{
    translate([0, skruelaengde/2,0]){
        rotate(-default_rotation) {cylinder(skruelaengde, d=skruediameter, center=true);
        translate([0,0,skruelaengde-forsaenkning]) cylinder(forsaenkning, d=forsaenkningdiameter, center=true);}
    }
}


module placer_skruehuller(skruelaengde, skruediameter, forsaenkning, forsaenkningdiameter, placeringer)
{
    for(i = placeringer)
    {
       translate(i) skrue(skruelaengde, skruediameter, forsaenkning, forsaenkningdiameter );
    }
}