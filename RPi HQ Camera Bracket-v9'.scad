/*
from - https://github.com/baryah/RPi_HQ_Camera_Cooling_Bracket

This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU Lesser General Public License for more details.
   You should have received a copy of the GNU Lesser General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

//uses tearDrop-cylinder.scad from http://www.thingiverse.com/thing:3457

//Bracket to etend the body of RPi HQ Camera and mount 'things', such that the 'things' does not exert weight on the circuit plate of the camera.
// all the dimentions are in 'mm'.
//dimentions taken from https://datasheets.raspberrypi.org/hq-camera/hq-camera-mechanical-drawing.pdf. Some which are not given in the dataset, were measured using vernier caliper.
use <tearDrop-cylinder.scad>

/* [Primary (Essential)] */
parts=true;
//all,1-top-1,2-top-2,3-bottom (full),3.75,3.85,3.95 (parts of 3),4-air duct-1,5-air duct-2,6-fan bracket,7-mesh bracket,8-Bracket RPi-1,9-Bracket RPi-2,9.5-Full Bracket_RPi,10-Wire box lid, 11-tripod ball head quick fix n release plate]
which_one="all"; //[all,1,2,3,3.75,3.85,3.95,4,5,6,7,8,9,9.5,10,11]
//which_one="all"; //[all,top-1,top-2,bottom,air duct-1,air duct-2,fan bracket,mesh bracket,RPi-1,Bracket_RPi-2,Wire box lid]
/* [Smoothness of curves - larger the no smoother the curves.] */
fn=50;
/* [These affect only when option 'parts' is not selected] */
x_pos=0.01;
y_pos=0.01;
z_pos=0.01;
x_angle=0.00;
y_angle=0.00;
z_angle=0.00;
/*[Air Duct - Using or not] */
//If using air duct, space for screw head is carved out in the RPi Argon Case bracket, else a space for nut is carved out.
using_air_duct=true;
/*[Ball Head Quick Release Plate - Using or not]*/
//Whether using Tripod Ball Head Quick Release plate fixed to the Air Duct
using_ball_head_plate=true;
/*[Tripod Mount]*/
//The tripod mount with the RPi HQ camera - can be taken off. If using, it must be reversed and the Ball Head Quick Release Plate not fixed to the airduct.
tripod_mount=true;
/*[The support structure around tripod mount - cannot be used without the Tripod Mount]*/
//This is a support structure around the tripod mount. Better to use it with the tripod mount, else the camera might tilt a bit when mounted on the ball head of tripod due to packing on it.
tripod_mount_support=true;

/*[Hidden] */
//diameter and height of the body of the RPi HQ Camera main body. actual diameter is 35.1mm, kept at 35.3 to ensure it fits. Similarly height of body has been kept at 10 mm while it actually is 10.2mm
diameter_rpi_cam=35.3;
height_rpi_cam=10;
//width and height of the small protuberance on the body of RPi HQ Camera in which the screw to fix the back focus distance screw
width_back_focus=10.16;
height_back_focus=5.02;
//width (maximum) and height of the tripod mount screw assembly
width_tripod_asm=24.52;
height_tripod_asm=7.62;
//side of the base plate i.e. the circuit plate of the camera
side_circuit=38;
//width and height of the side screw blocks to tighten the bracket on to the RPi HQ Camera. and the screw hole size
w_screw_block=15;
h_screw_block=8;
screw_block_hole=3.5;
//screw size of RPi Cam Circuit board
screw_circuit=2.9;
//Thickness of bottom part
thick_bottom=10.5+2;
//length of a side of peltier module.
side_peltier=40;
//thichness of peltier module
thick_peltier=3.9;
//thickness of the air duct
thick_air_duct=75;
//Fan bracket dimentions
side_fan=75;
thick_fan=25;
fan_size=61;
//RPi ArgonNeo Case dimentions
ln_rpi_bracket=96;
wd_rpi_bracket=72.5;
ht_rpi_bracket=27.9;
ht_2_rpi_bracket=15.5+5;
screw=3.5;

//ball head fix
length=52.96;
top_width=38.04;
bottom_width=42.86;
side_back_part=21.62;
bevelled_part_from_top=8.7;
width_front=42.7;
bevelled_front=26;
ht_non_bevelled_from_bottom=2;
notch_starts=16.7;
total_height=10.7;
thickness_sheet=5.5;
non_bevelled_front=5;




$fn=fn;

if(parts)
{
    
    //Draw individual parts
    
if(which_one=="1" || which_one=="all")
    {
        loc=which_one=="1"?[0,0,0]:[side_circuit/2+8,side_circuit/2+12,0];
translate(loc)
{
    difference()
    {
        draw_top();
        {
            translate([-side_circuit/2-8, 0, 0])
            cube([side_circuit+16, side_circuit/2+40, height_rpi_cam+1]);
        }
    }

}

}

if(which_one=="2" || which_one=="all"){
    loc=which_one=="2"?[0,0,0]:[side_circuit/2+8,side_circuit/2+17,0];
translate(loc)
{
    difference()
    {
        draw_top();
        {
            translate([-side_circuit/2-8, -side_circuit/2-12, 0])
            cube([side_circuit+16, side_circuit/2+12, height_rpi_cam+11]);
        }
    }

}}

if(which_one=="3"  || which_one=="all"){
    loc=which_one!="all"?[0,0,9]:[3*(side_circuit/2+12),side_circuit/2+14,thick_bottom];

    translate(loc)
    draw_bottom();
}   

if(which_one=="3.75") {
    loc=[0,0,9];
    difference()
    {
    translate(loc)
    draw_bottom();
    translate([-side_circuit/2-10,-side_circuit/2-12,3.5-2])
    cube([side_circuit+20,90,7.5+2]);
    }
}
if(which_one=="3.85") {
    loc=[0,0,9];
    difference()
    {
    translate(loc)
    draw_bottom();
    translate([-side_circuit/2-10,-side_circuit/2-12,-0.5-2])
    cube([side_circuit+20,90,4+2]);
    }
}

if(which_one=="3.95") {
    loc=[0,0,9];
    difference()
    {
    translate(loc)
    draw_bottom();
    translate([-side_circuit/2-10,-side_circuit/2-12,-0.5-2])
    cube([side_circuit+20,90,4]);
    translate([-side_circuit/2-10,-side_circuit/2-12,3.5])
    cube([side_circuit+20,90,7.5]);
    }
}




if(which_one=="4" || which_one=="all"){
    
    loc=which_one=="4"?[3*(side_circuit/2+35),0,thick_air_duct]:[6*(side_circuit/2+35),0,thick_air_duct];
    
translate(loc){
    rotate([0,180,0])
difference()
{
    translate([3*(side_circuit/2+35),side_circuit/2+14,thick_air_duct+thick_bottom])
        draw_air_duct();

    translate([125,0,0])
        cube([70,90,10]);
}}}

if(which_one=="5" || which_one=="all"){
    
    loc=which_one=="5"?[3*(-side_circuit/2-35),-side_circuit/2-104,0]:[0,25,0];
    
    translate(loc)
difference()
{
    translate([3*(side_circuit/2+35),side_circuit/2+104,thick_air_duct+thick_bottom])
        draw_air_duct();

    translate([125,89,10])
        cube([70,110,80]);
}}

if(which_one=="6" || which_one=="all"){
    
    loc=which_one=="6"?[0,0,0]:[3*(side_circuit/2+70),side_circuit/2+21,0];
    
translate(loc)
    rotate([180,0,0])
    draw_fan_bracket("fan");
}

if(which_one=="7" || which_one=="all"){
    
    loc=which_one=="7"?[0,0,0]:[3*(side_circuit/2+100),side_circuit/2+21,0];
    
translate(loc)
    rotate([180,0,0])
    draw_fan_bracket("mesh");
}

if(which_one=="8" || which_one=="all"){
    
    loc=which_one=="8"?[0,0,-ht_rpi_bracket*3+2]:[3*(side_circuit/2+140),34,-ht_rpi_bracket*4+ht_rpi_bracket];
    
    
translate(loc)
  rotate([0,180,0]) 
{
    difference()
    {
    draw_rpi_argon_bracket();
        
    rotate([0,0,90])    
            translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-10-0]) 
                    translate([-wd_rpi_bracket/2-15,ln_rpi_bracket,ht_2_rpi_bracket/2])
                            cube([15,17,1]); 
    rotate([0,0,90])
            translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-10-0]) 
                        translate([-wd_rpi_bracket/2-15,15,ht_2_rpi_bracket/2])
                                cube([15,11,1]);
        
    translate([5,-(ln_rpi_bracket+25)/2,-ht_2_rpi_bracket+4.3])
        {
            rotate([0,0,90])
                translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-3.5])
            //translate([-wd_rpi_bracket/2-20,-5,ht_2_rpi_bracket/2])
                    cube([wd_rpi_bracket+40, ln_rpi_bracket+25,20]);
        }
    }
} }

if(which_one=="9" || which_one=="all"){
    
    loc=which_one=="9"?[0,0,ht_rpi_bracket*4+8]:[3*(side_circuit/2+180),34,ht_rpi_bracket*4+8];
    
translate(loc)
{
    union()
    {
        difference()
        {
            draw_rpi_argon_bracket();
                translate([5.5,-(ln_rpi_bracket+25)/2,-ht_2_rpi_bracket+11.1])
                {
                    rotate([0,0,90])
                translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket+10])
            
                            cube([wd_rpi_bracket+40, ln_rpi_bracket+25,40]);
                }
        }
    rotate([0,0,90])    
            translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-10-0]) 
                    translate([-wd_rpi_bracket/2-15,ln_rpi_bracket,ht_2_rpi_bracket/2])
                            cube([15,10,1]); 
    rotate([0,0,90])
            translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-10-0]) 
                        translate([-wd_rpi_bracket/2-15,15,ht_2_rpi_bracket/2])
                                cube([15,11,1]);
     }
} 
}

if(which_one=="9.5"){
    
    loc=[0,0,-ht_rpi_bracket*3+2];
    
    
translate(loc)
  rotate([0,180,0]) 
    draw_rpi_argon_bracket();
}

if(which_one=="10" || which_one=="all"){
    
    loc=which_one=="10"?[0,0,0]:[3*(side_circuit/2+170),120,3];
    
    translate(loc)
        draw_cover_wire_chamber();
}
    
if(which_one=="11" || which_one=="all"){
    
    loc=which_one=="11"?[0,0,total_height+3]:[3*(side_circuit/2+200),bottom_width+2,3];
    
    translate(loc)
        rotate([180,0,0])
        ball_head_fix();
    

}
}
else
{
    //Draw the entire contraption
    rotate([x_angle, y_angle, z_angle])
    translate([x_pos,y_pos,z_pos])
    //Draw the entire structure as it will appear assembled
    {   
        translate([0,0,-1])
        draw_top();    
        translate([0,0,-1])
        draw_bottom();    
        if(using_air_duct)
            {
                draw_air_duct();
/*
//temp
    rotate([0,180,0])
    translate([58,0,17])
    //temp
*/
        
        
                rotate([90,0,-90])
                    translate([side_circuit/2+12-side_fan/2-0.5, -thick_bottom-thick_air_duct+side_fan/2, side_circuit/2+10+thick_fan])
                    draw_fan_bracket("fan");
    
    
                //the other side - where did the 13 added to x axis in translate come from - not sure
                rotate([90,0,90])
                    translate([side_circuit/2+12-side_fan/2+13+6+0.5, -thick_bottom-thick_air_duct+side_fan/2, -side_circuit/2+10+thick_fan+side_circuit])
                    draw_fan_bracket("mesh");
     
                draw_rpi_argon_bracket();
                
     
     if(using_ball_head_plate){
     //fix the ball head part
            //rotate([90, 180,0])
                //translate([-side_circuit/2-10+2,length/2+thick_air_duct/2+2,thick_air_duct-thick_bottom-22])  //remove the last 4
                translate([length/2, -side_circuit-7, -thick_bottom-thick_air_duct+(thick_air_duct-bottom_width)/2])    
                rotate([-90, 180, 0])    
                        ball_head_fix();
                 
     }

 }
else {
 
                translate([0, 0, thick_air_duct]) draw_rpi_argon_bracket();}
                

   

   }
    
}














module draw_air_duct()
{
//Draws the air-duct part

difference()
{
    union()
    {
        //the main body of the air duct
        translate([-side_circuit/2-10, -side_circuit/2-12,-thick_bottom-thick_air_duct])
            roundedcube(side_circuit+20, thick_air_duct+3+4+6-2.5, thick_air_duct, 1);
        //the extension on the side wall which will carry the fan wire
        translate([-side_circuit/2-10, side_circuit/2+25+3,-thick_bottom])
            rotate([0, 90, 0])
            roundedcube(15, 17+3, side_circuit+20, 1);
            //cube([side_circuit+20, 17+3, 15]);
       
 /*      if(using_ball_head_plate)
           {
            //fix the ball head part
            rotate([90, 180,0])
                translate([-side_circuit/2-10+2,length/2+thick_air_duct/2+2,thick_air_duct-thick_bottom-22])
                    rotate([0, 180, 180])    
                        ball_head_fix();
           }*/
        
    }
       
    //difference 
    
    //cut out the central space
    //%translate([-side_circuit/2-10, -(side_peltier+1)/2-3.5+3+3,-thick_bottom-thick_air_duct+7])
    translate([-side_circuit/2-10, -(side_peltier+1)/2,-thick_bottom-thick_air_duct+7])
        cube([side_circuit+20, thick_air_duct-(side_circuit/2+12-(side_peltier+1)/2)*2+7, thick_air_duct-14]);
    //translate([-(side_peltier+1)/2, -(side_peltier+1)/2-3.5+3+3, -thick_bottom-thick_air_duct])
    translate([-(side_peltier+1)/2, -(side_peltier+1)/2, -thick_bottom-thick_air_duct])
        cube([side_peltier+1, thick_air_duct-(side_circuit/2+12-(side_peltier+1)/2)*2+7, thick_air_duct]);

    
    //cuts space for the flat cable
    {difference()
        {
    translate([-(25)/2, -(side_circuit+1)/2-9.5+3,-thick_bottom-thick_air_duct])
        cube([25, 3, thick_air_duct]);
    translate([side_peltier/2-9.5-5, -side_peltier/2-9, -thick_bottom-5])
        cube([9,11,5]);    
        }
    }
    //cut tunnel for peltier wire
    translate([-(25)/2,(side_circuit+1)/2+19.5+4.5+3,-thick_bottom-10])
        cube([25, 5, 10]);
    translate([-(25)/2,(side_circuit+1)/2+20+6+3,-thick_bottom-10])
        cube([25, 5, 8]);
    translate([-(25)/2-17,(side_circuit+1)/2+24.5+9.5,-thick_bottom-10])
        cube([42, 10, 5]); // need to do the same changes in the fan bracket
        
    //grooves to accomodate the heat sink side arm and screws
    {
        difference()
        {
    translate([side_peltier/2-9.5-4, -side_peltier/2-9, -thick_bottom-4])
        cube([8,9,4]);
    translate([side_peltier/2-9.5-4, -side_peltier/2-2, -thick_bottom-4])
        cube([8,2,2]);
        }
    }
        
   /* translate([-side_peltier/2+9.5, side_peltier/2+5.5, -thick_bottom])
        cylinder(h=6, d=3);
    translate([side_peltier/2-9.5, -side_peltier/2-5.5, -thick_bottom])
        cylinder(h=6, d=3);
    translate([-side_peltier/2+9.5-3, side_peltier/2+5.5-5.5, -thick_bottom+2])
        cube([6,8.5,2.4]);
    translate([side_peltier/2-9.5-3, -side_peltier/2-5.5-5.5, -thick_bottom+2])
        cube([6,8.5,2.4]);
  */    
        
    //cut two screw holes in the outer wings of the bracket towards tripod screw side to fix top with the bottom and through to the other parts of the bracket
    for(i=[-1,1])
    {
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, -thick_bottom-20])
            cylinder(h=20, d=screw);
            //%cylinder(h=thick_air_duct, d=screw);
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, -thick_bottom-thick_air_duct])
            cylinder(h=20, d=screw);        
            //%cylinder(h=thick_air_duct, d=screw);
        translate([(i*side_circuit/2-2.5*i-3), -side_circuit/2-7-5, -thick_bottom-20+7])
            cube([6,9,2.5]);//CUT FOR NUT ????
        translate([(i*side_circuit/2-2.5*i-3), -side_circuit/2-7-5, -thick_bottom-thick_air_duct+20-7])
            cube([6,9,2.5]);//CUT FOR NUT ????      
        
        
        //holes to fix the fan bracket
        translate([i*(side_circuit+3)/2+(i*8.5)/2, -side_circuit/2-12+15+3+3-2.5, -thick_bottom-7.5/2+0.25])
          rotate([0,180,0])
            teardrop(screw/2, 8.5, 90);
        //nut
        translate([i*(side_circuit+3)/2+i+i, -side_circuit/2-12+15+3+3-2.5, -thick_bottom-7.5/2+0.25])
          rotate([0,90,0])
            cube([6,6,4],true);

         translate([i*(side_circuit+3)/2+(i*8.5)/2, -side_circuit/2-12+15+3+0.5, -thick_bottom-thick_air_duct+7.5/2-0.25])   
            teardrop(screw/2, 8.5, 90);
        //nut
        translate([i*(side_circuit+3)/2+i+i, -side_circuit/2-12+15+3+0.5, -thick_bottom-thick_air_duct+7.5/2-0.25])
          rotate([0,90,0])
            cube([6,6,4],true);

         translate([i*(side_circuit+3)/2+(i*8.5)/2, side_circuit/2+(thick_air_duct-side_circuit-12)-15+3+0.5, -thick_bottom-7.5/2+0.25])
          rotate([0,180,0])
            teardrop(screw/2, 8.5, 90);
        //nut
        translate([i*(side_circuit+3)/2+i+i, side_circuit/2+(thick_air_duct-side_circuit-12)-15+3+0.5, -thick_bottom-7.5/2+0.25])
          rotate([0,90,0])  
            cube([6,6,4],true);

        translate([i*(side_circuit+3)/2+(i*8.5)/2, side_circuit/2+(thick_air_duct-side_circuit-12)-15+3+0.5, -thick_bottom-thick_air_duct+7.5/2-0.25])
            teardrop(screw/2, 8.5, 90);
            //nut
        translate([i*(side_circuit+3)/2+i+i, side_circuit/2+(thick_air_duct-side_circuit-12)-15+3+0.5, -thick_bottom-thick_air_duct+7.5/2-0.25])
          rotate([0,90,0])
          cube([6,6,4],true);

    }
    
     //cut two longish screw holes in the outer wings of the bracket towards back focus screw to fix top with the bottom and through to the other parts of the bracket
     for(i=[-1,1])
    {
        hull()
        {
            translate([(i*side_circuit/2+4*i), 44-1.8+5+3-2.5, -thick_bottom-thick_air_duct])
                cylinder(h=thick_air_duct, d=screw);
            translate([(i*side_circuit/2+4*i), 44-1.8+5+2-2.5, -thick_bottom-thick_air_duct])
                cylinder(h=thick_air_duct, d=screw);

        }
        
        hull()
        {//NUT
        translate([(i*side_circuit/2+4*i-3), 44-1.8+5+3-3-2.5, -thick_bottom-20])
            cube([6.2,10,2.5]);//CUT FOR NUT
        translate([(i*side_circuit/2+4*i-3), 44-1.8+5+2-3-2.5, -thick_bottom-20])
            cube([6.2,10,2.5]);//CUT FOR NUT 
        }
        
        hull()
        {//NUT
        translate([(i*side_circuit/2+4*i-3), 44-1.8+5+3-3-2.5, -thick_bottom-thick_air_duct+14])
            cube([6.2,10,2.5]);//CUT FOR NUT ????
        translate([(i*side_circuit/2+4*i-3), 44-1.8+5+2-3-2.5, -thick_bottom-thick_air_duct+14])
            cube([6.2,10,2.5]);//CUT FOR NUT ????
        }
    }
    
    
    //holes and nut spaces to fix the quick release plate for ball head
    /*translate([-length/2+5,-side_circuit/2-3, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4])
        rotate([90,0,0])
        %cylinder(h=9, d=screw);*/
    translate([-length/2+5,-side_circuit/2-7.5, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4])
        rotate([0,180,90])
            teardrop(screw/2, 9, 90);
    
    translate([-length/2+5+3,-side_circuit/2-8, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4-3])
        rotate([0,0,90])
        cube([2,11,6]);
    
    
    /*translate([length/2-5,-side_circuit/2-3, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4])
        rotate([90,0,0])
        %cylinder(h=9, d=screw);*/
    translate([length/2-5,-side_circuit/2-7.5, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4])    
        rotate([0,180,90])
            teardrop(screw/2, 9, 90);
    translate([length/2-5+8,-side_circuit/2-8, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width/4-3])
        rotate([0,0,90])
        cube([2,11,6]);
    
     /*translate([-length/2+5,-side_circuit/2-3, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4])
        rotate([90,0,0])
        %cylinder(h=9, d=screw);*/
     translate([-length/2+5,-side_circuit/2-7.5, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4])
        rotate([0,180,90])
            teardrop(screw/2, 9, 90);
    translate([-length/2+5+3,-side_circuit/2-8, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4-3])
        rotate([0,0,90])
        cube([2,11,6]); 
  
      /*translate([length/2-5,-side_circuit/2-3, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4])
        rotate([90,0,0])
        %cylinder(h=9, d=screw);*/
      translate([length/2-5,-side_circuit/2-7.5, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4])
        rotate([0,180,90])
            teardrop(screw/2, 9, 90);
    translate([length/2-5+8,-side_circuit/2-8, -thick_bottom-(thick_air_duct-bottom_width)/2-bottom_width*3/4-3])
        rotate([0,0,90])
        cube([2,11,6]);  
    
    
}      

}









module draw_bottom()
{
difference()
{

    union()
    {
    
        translate([-side_circuit/2-10, -side_circuit/2-12,-thick_bottom+1])
            roundedcube(side_circuit+20, thick_air_duct+7+6,thick_bottom+1, 1);
     
     //add the tripod mount support structure   
            if (tripod_mount && tripod_mount_support)
            {
            translate([-side_circuit/2-8, -side_circuit/2-12,2])
                cube([side_circuit+3+13, 1.8, 15]);
            }
        }
    
    //difference part
        
        //cut out the tripod mount support structure hole
                    if (tripod_mount && tripod_mount_support)
        {
        //draws the cover around the tripod assembly - insisde cut
        translate([-(width_tripod_asm)/2, -side_circuit/2-12,height_rpi_cam-height_tripod_asm])
            cube([width_tripod_asm, 2, 11]);
        }
        
        translate([-side_circuit/2-8.2, -side_circuit/2-10.2,0])
            roundedcube(side_circuit+16.4, thick_air_duct+7+6-2*1.6,2, 1);
    

    //cut a cube to allow the circuit board with the flat cable of camera to slide into the bracket
    //translate([-(side_circuit+1)/2, -(side_circuit+1)/2-8,-thick_bottom])
    //    cube([side_circuit+1, side_circuit+1+8, thick_bottom]);
    //cut a cube to allow the circuit board and peltier module with the flat cabel of camera to slide into the bracket
    //space for peltier
    translate([-(side_peltier+1)/2, -(side_peltier+1)/2,-thick_bottom])
        cube([side_peltier+1, side_peltier+1, thick_bottom]);
    
        //groove for the aluminium plate
     translate([-(side_peltier+1)/2-2, -(side_peltier+1)/2-1,-thick_bottom])
        cube([side_peltier+1+4, side_peltier+1+3, 2]);
        
        //screw holes and nuts for heat sink (40x40x25mm sink)   
    translate([-side_peltier/2+9.5, side_peltier/2+5.5, -thick_bottom])
        cylinder(h=6, d=3);
    translate([side_peltier/2-9.5, -side_peltier/2-5.5, -thick_bottom])
        cylinder(h=6, d=3);
    translate([-side_peltier/2+9.5-3, side_peltier/2+5.5-5.5, -thick_bottom+2])
        cube([6,8.5,2.4]);
    translate([side_peltier/2-9.5-3, -side_peltier/2-5.5-5.5, -thick_bottom+2])
        cube([6,8.5,2.4]);
        
          //translate([-(side_peltier+1)/2, -(side_peltier+1)/2,-thick_bottom])
        //cube([side_peltier+1, side_peltier+1, 2]);


    //cuts space for the flat cable
    translate([-(25)/2, -(side_circuit+1)/2-3.5,-thick_bottom+8])
        cube([25,2.5, thick_bottom-8]);
    translate([(25)/2-6, -(side_circuit+1)/2-3.5,-thick_bottom+8])
        cylinder(h=thick_bottom-8, d=6);
    translate([(25)/2-6, -(side_circuit+1)/2-3.5-1.5,-thick_bottom+5])
        cylinder(h=thick_bottom-5, d=3);

    
    
    translate([-(25)/2, -(side_circuit+1)/2-9.5+3,-thick_bottom])
        cube([25-6, 3, thick_bottom]);
    
    //cut space for passage of peltier wire - CREATE A GROOVE TO HOLD THE TEMPERATURE PROBE ALONG ONE OF THE EDGES
     translate([-(25)/2, (side_circuit+1)/2+1+19,-thick_bottom+8])
        cube([33,4, thick_bottom-8]);  
     translate([(41)/2-4, (side_circuit+1)/2+1,-thick_bottom+8])
        cube([4,21.5, thick_bottom-8]);
     //%translate([(41)/2-7, (side_circuit+1)/2+1+19,-thick_bottom+6])
        //cube([7,4, thick_bottom-6]);
     translate([-(25)/2,(side_circuit+1)/2+19.5+4.5,-thick_bottom+8])
        cube([25, 3, thick_bottom-8]);
     translate([-(25)/2,(side_circuit+1)/2+19.5+4.5+3,-thick_bottom])
        cube([25, 5, thick_bottom]);
           
             //groove for peltier wire
     hull() 
        {       
     translate([-(side_peltier+1)/2+1.5, (side_peltier+1)/2, -thick_bottom])
        cylinder(h=5, d=3);
     translate([-(side_peltier+1)/2+1.5, (side_peltier+1)/2+2, -thick_bottom])
        cylinder(h=5, d=3);
         }
     hull() 
        {
     translate([-(side_peltier+1)/2+1.5, (side_peltier+1)/2+2, -thick_bottom])
        cylinder(h=3, d=3);
     translate([-(25)/2+1,(side_circuit+1)/2+19.5+4.5+3,-thick_bottom])
        cylinder(h=3, d=3);
        }  
     hull() 
        {       
     translate([(side_peltier+1)/2-1.5, (side_peltier+1)/2, -thick_bottom])
        cylinder(h=5, d=3);
     translate([(side_peltier+1)/2-1.5, (side_peltier+1)/2+2, -thick_bottom])
        cylinder(h=5, d=3);
         }
     hull() 
        {
     translate([(side_peltier+1)/2-1.5, (side_peltier+1)/2+2, -thick_bottom])
        cylinder(h=3, d=3);
     translate([(25)/2-1,(side_circuit+1)/2+19.5+4.5+3,-thick_bottom])
        cylinder(h=3, d=3);
        }   
    
    
     //cut two screw holes in the outer wings of the bracket towards tripod screw side to fix top with the bottom and through to the other parts of the bracket
     for(i=[-1,1])
    {
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, -thick_bottom])
            cylinder(h=thick_bottom, d=screw);
        //translate([(i*side_circuit/2+4*i)-3, -side_circuit/2-4-3, -thick_bottom])
            //cube([6,6,2]);
    }
    
     //cut two longish screw holes in the outer wings of the bracket towards back focus screw to fix top with the bottom and through to the other parts of the bracket
     for(i=[-1,1])
    {
        hull()
        {
            
            translate([(i*side_circuit/2+4*i), 44-1.8+5+3-2.5, -thick_bottom])
                cylinder(h=thick_bottom, d=screw);
            translate([(i*side_circuit/2+4*i), 44-1.8+5+2-2.5, -thick_bottom])
                cylinder(h=thick_bottom, d=screw);

        }
    }     
}
}







module draw_top()
//draws the two parts of the top most part of the bracket, which holds the RPi camera tightly
//total height of the part is 10.2mm with a hole of diameter 35.3mm in the centre.
//Actual diameter of the RPi HQ camera barrel is 35.1mm.
//There are screw holes to fix the circuit plate of the RPi HQ cam with it.
//The two parts are tightened together with the help of a screw and nut to tighten it around the RPi HQ camera
{
difference()
{   
    union()
    {
        //draws the main body of the bracket, which will have the central hole where the RPi camera body will fit
        add_side_circuit=(tripod_mount_support && tripod_mount?4:0);
        translate([-side_circuit/2-1, -side_circuit/2-2-add_side_circuit, 0])
            roundedcube(side_circuit+2, side_circuit+4+add_side_circuit, height_rpi_cam, 1);
        //draws the side flange, which will have screws for fixing the contraption with say an RPi case  - goes 10 mm below the main body of RPi HQ cam
        translate([-side_circuit/2-8, -side_circuit/2-10,0])
            roundedcube(side_circuit+16, thick_air_duct-2+5.4+6, height_rpi_cam-height_back_focus, 1);
        if (tripod_mount && tripod_mount_support)
        {
        //draws the cover around the tripod assembly
        translate([-(width_tripod_asm+0.08)/2-8-6.7, -side_circuit/2-10,height_rpi_cam-height_back_focus])
            roundedcube(side_circuit+3+13, 5, 15-2.98, 1);
        }
             
        //draws the side screw blocks which would be cut in the center, along with the entire bracket (some 0.5mm would be removed throughout) and screw holes to fit in a screw, which after tightening, would hold the bracket tightly around the RPi Camera Body.
        translate([-side_circuit/2-h_screw_block,-w_screw_block/2,0])
            cube([h_screw_block,w_screw_block,height_rpi_cam+1]);
        translate([side_circuit/2,-w_screw_block/2,0])
            cube([h_screw_block,w_screw_block,height_rpi_cam+1]);
    }
     //difference part
            if (tripod_mount && tripod_mount_support)
        {
        //draws the cover around the tripod assembly - insisde cut
        translate([-(width_tripod_asm)/2, -side_circuit/2-10,height_rpi_cam-height_back_focus])
            cube([width_tripod_asm, 5, 8+0.4]);
        }
    
    //draws the inner cylindrical cut for the Rpi camera body to fit in
    cylinder(h=height_rpi_cam, d=diameter_rpi_cam);

    //cuts out the back focus screw region out
    translate([-width_back_focus/2, diameter_rpi_cam/2-1, height_rpi_cam-height_back_focus])
        cube([width_back_focus,5, height_back_focus]);

    translate([width_back_focus/2-2, diameter_rpi_cam/2+1.3+2, height_rpi_cam-height_back_focus])
        rotate([0,0,-70])
    cube([4,12, 5.2]);
        //cylinder(h=5.2, r=2);    
    
    
    if (tripod_mount)
    {    
    //cuts out the region where the tripod mount fits
    translate([-width_tripod_asm/2, -diameter_rpi_cam/2-15, height_rpi_cam-height_tripod_asm])
        cube([width_tripod_asm, 20, height_tripod_asm]);
    }
    
    //cuts out the screw holes in the side screw blocks
    for(i=[-1,1])
    {
      
        translate([i*side_circuit/2+i*h_screw_block/2,(thick_air_duct-2+5.4+6)/2-side_circuit/2-10,height_rpi_cam/2+1])
            rotate([0,0,-90])
        teardrop(screw_block_hole/2, thick_air_duct-4, 90);


        translate([i*side_circuit/2+i*h_screw_block/2, w_screw_block/2+(thick_air_duct-2+5.4-side_circuit/2-10-w_screw_block/2)/2-6/2,height_rpi_cam/2+1])
            rotate([0,0,-90])
                teardrop(3, (thick_air_duct-2+5.4-side_circuit/2-10-w_screw_block/2)+2-3, 90);
    }
    
    //cuts holes for nut for the screw block screw
    for(i=[-1,1])
    {
    translate([i*side_circuit/2+(i==1?0:i*h_screw_block)+(h_screw_block-6)/2, -w_screw_block/2+1.5, height_rpi_cam/2-3+1])
            cube([6, 2.5, 8]);
    }

    
    
    
    //cuts four screws in the bracket, corresponding to the screw holes on the circuit board
    for(i=[-1,1], j=[-1,1])
    {
        if(j!=1) //decides which side screw to be elongated
        {
        translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4*j), 0])
            cylinder(h=height_rpi_cam, d=screw_circuit);
            //screwHole(screw_circuit,height_rpi_cam,6,2);
        translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4*j), height_rpi_cam-8])
            cylinder(h=height_rpi_cam, d=screw_circuit+2.5);
        }
        else
        {
                  hull()
        {
            
            translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4*j), 0])
                cylinder(h=height_rpi_cam, d=screw_circuit);
            translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4.5*j), 0])
                cylinder(h=height_rpi_cam, d=screw_circuit);

        }
                   hull()
        {
            
            translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4*j), height_rpi_cam-8])
                cylinder(h=height_rpi_cam, d=screw_circuit+2.5);
            translate([(i*side_circuit/2-4*i), (j*side_circuit/2-4.5*j), height_rpi_cam-8])
                cylinder(h=height_rpi_cam, d=screw_circuit+2.5);

        }
        }
        
        
        
    }

    
    //cuts the bracket into two parts, 0.5 mm apart, to allow to make it fit tight on RPi Cam body with screw.
    translate([-side_circuit/2-h_screw_block, -0.2, 0])
        cube([side_circuit+2*h_screw_block, 0.5, height_rpi_cam+1]);
    
    //cut four screw holes in the outer wings of the bracket to fix the upper with the lower part etc
         for(i=[-1,1])
    {
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, height_rpi_cam-height_back_focus])
            cylinder(h=15, d=6);
    }
     for(i=[-1,1])
    {
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, 0])
            //cylinder(h=height_rpi_cam-height_back_focus, d=screw);
            screwHole(screw,height_rpi_cam-height_back_focus,6,2);
        //translate([(i*side_circuit/2+4*i), -side_circuit/2-6, 3])
          //  cylinder(h=height_rpi_cam, d=screw+2.5);
        

        translate([(i*side_circuit/2+4*i), 44-1.8+3+5-2.5, 0])
            //cylinder(h=height_rpi_cam+10, d=screw);
            screwHole(screw,height_rpi_cam-height_back_focus,6,2);
        //translate([(i*side_circuit/2+4*i), 44-1.8+3+5, 3])
          //  cylinder(h=height_rpi_cam+10, d=screw+2.5);
        
            
    }
}   
}


module draw_fan_bracket(type)
{
    difference()
    {
        union()
        {
            translate([-side_fan/2-3,-side_fan/2,-thick_fan])
                roundedcube(side_fan,side_fan,thick_fan, 1);
                //cube([side_fan,side_fan,thick_fan]);
            if(type=="fan")
            {
                //draw the extension which will carry the wire from the fan
                translate([-side_fan/2-17-5.5, -side_fan/2, -thick_fan])
                    roundedcube(21.5,side_fan, thick_fan,1);
                    //cube([17,side_fan, thick_fan]);
                //the supports to keep the thermostat in place
                translate([-side_fan/2-12.5-5.2-0, -side_fan/2, -thick_fan-6])
                    cube([2.5,side_fan-15,6]);
                
            }
            else
            {
                //draw the dummy on the mesh side for symmetry
                translate([side_fan/2-5, -side_fan/2, -thick_fan])
                    roundedcube(21.5,side_fan, thick_fan, 1);
                    //cube([17,side_fan, thick_fan]);
                //the supports to keep the thermostat in place
                translate([side_fan/2+4+5.2+0, -side_fan/2, -thick_fan-6])
                    cube([3,side_fan-15,6]);                
                
            }
            //make elevations around the screw holes to fix the brackets with the air duct
                    for(i=[1,-1] , j=[1,-1])
                    {
                        ln_elevation=(j==1?thick_fan:4.8);
                        difference()
                        {
                        translate([i*side_fan/2-i*15-3, j*side_fan/2-j*7.5/2+j*0.25, -ln_elevation])
                            cylinder(h=ln_elevation, d = 10);
                        translate([i*side_fan/2-i*15-3, j*side_fan/2-j*7.5/2+j*0.25-j*5/2, -ln_elevation/2])
                            cube([10, 5, ln_elevation], true);                           
                            
                        }
                    }
        }
        
        //difference
        
         if(type=="fan")
            {
                //draw the hole in the side wall of fan bracket for wire
                translate([-side_fan/2-3, -thick_fan, -15])
                    cube([7,thick_fan-12, 7]);
                //continue the wire tunnel
                translate([-side_fan/2-10-5.5, -side_fan/2+5+side_fan-30, -thick_fan+4])
                    cube([12.5,20, thick_fan-8]);
                translate([-side_fan/2-10-5.5, -side_fan/2+8, -thick_fan])
                    cube([12.5,side_fan-33, thick_fan-4]);
                //hole for the peltier wire                
                translate([-side_fan/2-10-6-3, -side_fan/2+5+side_fan-22+7, -thick_fan])
                    cube([10,5, thick_fan-4]);
                //groove for lid
                //translate([-side_fan/2-15-3, -side_fan/2+6, -thick_fan])
                //    cube([20,side_fan-29, 3]);
                //holes for screws of the lid
                //translate([-side_fan/2-15+2.5-3,-side_fan/2+6+3.5,-thick_fan+3]) cylinder(h=4, d=2.4);
                //translate([-side_fan/2-15+2.5-3,-side_fan/2+3+side_fan-26-3.5,-thick_fan+3]) cylinder(h=4, d=2.4);
            }
        //cut out the central hollow in the fan bracket
        translate([-side_fan/2-3+7,-side_fan/2+7,-thick_fan])
            cube([fan_size,fan_size,thick_fan-4]);
        if(type=="fan")
        {
            //cut out space for fan. The fan is 60 x 60 mm x 15 mm in dimentions
            translate([0-3,0, -5])
                cylinder(h=5, d=60);
        }
        else
            {
                for(i=[1:12])
                {
                    //draw thw mesh
                    translate([-side_fan/2+3+i*5-3, -side_fan/2+8, -5])
                    cube([4, side_fan-16, 5]);
                }
                
            }
        
        
        for(i=[1,-1] , j=[1,-1])
            {
                if(type=="fan")
                {
                    //cut out the holes for the fan screws
                    translate([i*25-3,j*25, -5])
                        //cylinder(h=5, d=4.3);
                    screwHole(4.3,5,8,3.4);
                }
            //cut out the holes for fixing the fan and the mesh bracket with air duct    

            translate([i*side_fan/2-i*15-3, j*side_fan/2-j*7.5/2+j*0.25, -thick_fan])
                screwHole(screw, thick_fan-2, 6,2);
            translate([i*side_fan/2-i*15-3, j*side_fan/2-j*7.5/2+j*0.25, -2])
                cylinder(h=2, d=6);
            //translate([i*side_fan/2-i*15-3, j*side_fan/2-j*7.5/2, -2])
              //  cylinder(h=2, d=6);                
            }

        //hole for power connector 
        translate([-side_fan/2-17+3.5-3-2.5, -side_fan/2+17, -thick_fan/2-1])
            rotate([0,90,0])
                cylinder(h=7, d=12, center=true);
        translate([-side_fan/2-17-2-2.5, -side_fan/2+17, -thick_fan/2-1])
            rotate([0,90,0])
                cylinder(h=4, d=15, center=true);           
        }
    }


module draw_rpi_bracket()
{
//draw the rpi bracket

//bottom

//temp
    /*
%translate([-wd_rpi_bracket/2, 0,0])
cube([wd_rpi_bracket,ln_rpi_bracket,5]);
*/
//temp

difference()
    {
        union()
        {
            //translate([-wd_rpi_bracket/2, 0,0])
        //     cube([wd_rpi_bracket,15,5]);

            translate([-wd_rpi_bracket/2+10+12,0,0])
                cube([52-24,ln_rpi_bracket-15,5]);

            translate([-wd_rpi_bracket/2, ln_rpi_bracket-30,0])
                cube([wd_rpi_bracket,15,5]);

            for (i=[1,-1])
            {
                translate([-wd_rpi_bracket/2, 0,(i==1?0:ht_rpi_bracket+5)])
                    //cube([wd_rpi_bracket,15,5]);
                    cube([wd_rpi_bracket,(i==-1?28.5:20),5]);
    
                translate([i*wd_rpi_bracket/2-(i==1?i*10:0), ln_rpi_bracket-15,0])
                    cube([10,15,5]); 
    
                translate([i*wd_rpi_bracket/2-(i==1?i*15:0), ln_rpi_bracket,0])
                    cube([15, 10, ht_rpi_bracket+2]);
             //part towards the longish screw holes
                translate([i*wd_rpi_bracket/2-(i==1?i*16:0), (i==1?0:ln_rpi_bracket-26.5),ht_rpi_bracket+5])
                    cube([(i==1?16:wd_rpi_bracket), (i==1?ln_rpi_bracket:26.5), 5]);
    
                translate([i*wd_rpi_bracket/2+(i==1?0:i*5), 0,0])
                    cube([5, 20, ht_rpi_bracket+10]);   
            }
            //rest for front side of Argon neo opened (the side with USB ports)
            translate([wd_rpi_bracket/2-15, -5,ht_rpi_bracket])
                cube([20, 5, 10]);
            //rest for the other end of the Argon-Neo-open

            translate([-wd_rpi_bracket/2, ln_rpi_bracket-5,ht_2_rpi_bracket])
                cube([wd_rpi_bracket,5,ht_rpi_bracket-ht_2_rpi_bracket+10]); 
    
            //blocks for screws to tighten the screws
            for (i=[-1,1])
            {
                //%translate([i*wd_rpi_bracket/2-(i==1?i*15:0), ln_rpi_bracket+5,0])
                  //  cube([15,5,30]);
        
                translate([i*wd_rpi_bracket/2-(i==1?-5:15), 0, 0])
                    cube([10,20,30]);
            }
            //use this one to get one groove 
            translate([-wd_rpi_bracket/2-15,15,0])
                cube([15,11,ht_rpi_bracket+10]);
                       
            
            translate([-wd_rpi_bracket/2-15,15+10,ht_2_rpi_bracket])
                cube([15,ln_rpi_bracket-23.5-5+6,ht_rpi_bracket-ht_2_rpi_bracket+10]);
            translate([-wd_rpi_bracket/2,ln_rpi_bracket+2,ht_2_rpi_bracket])
                rotate([90,180,0])
                    raised_edge(ln_rpi_bracket-23.5-5+6,15);
            
            
            
            //use this to get second groove
            translate([-wd_rpi_bracket/2-15,ln_rpi_bracket,0])
                cube([15,10,ht_rpi_bracket+10]);
           
            
            //%translate([wd_rpi_bracket/2-13.5,15,ht_rpi_bracket+5])
                //cube([3.5,ln_rpi_bracket-10,5]);
            translate([wd_rpi_bracket/2, 15, ht_2_rpi_bracket])
                cube([10.5,ln_rpi_bracket-10+2,ht_rpi_bracket-ht_2_rpi_bracket+10]);
            translate([wd_rpi_bracket/2,ln_rpi_bracket/2-31,ht_2_rpi_bracket])
                rotate([90,180,180])
                    raised_edge(ln_rpi_bracket-10,10);
    
    
        }
        //for subtracting
        
        //some part of a pillar to accomotdate projection over screws
        translate([-wd_rpi_bracket/2-2,ln_rpi_bracket,ht_rpi_bracket+2])
                cube([2,10,8]);
        for (i=[-1,1])
            {
           
                translate([i*wd_rpi_bracket/2-(i==1?i*15:0)+15/2, ln_rpi_bracket+5,30])
                rotate([0,180,0]) screwHole(screw, 30, 6, 2);
                    //cylinder(h=30, d=screw);
                //translate([i*wd_rpi_bracket/2-(i==1?i*15:0)+15/2, ln_rpi_bracket+5+10/2,0])
                //    cylinder(h=2, d=6);
                translate([i*wd_rpi_bracket/2-(i==1?i*15:0)+15/2-3, ln_rpi_bracket+5-3,30-2])
                    cube([6,6,2]);
        
                translate([i*wd_rpi_bracket/2-(i==1?-5:15)+10/2, 15/2, 30])
                    rotate([0,180,0]) screwHole(screw, 30, 6, 2);
                    //cylinder(h=30, d=screw);
                //translate([i*wd_rpi_bracket/2-(i==1?-5:15)+10/2, 15/2, 0])
                //    cylinder(h=2, d=6);
                translate([i*wd_rpi_bracket/2-(i==1?-5:15)+10/2-3, 15/2-3, 30-2])
                    cube([6,6,2]);
            }
        //divide the frame into two to enable tightening
         translate([-wd_rpi_bracket/2-20,-5,ht_2_rpi_bracket/2])
            cube([wd_rpi_bracket+40, ln_rpi_bracket+25,0.6]);
        //create grooves for fittin
         translate([-wd_rpi_bracket/2-15,ln_rpi_bracket,ht_2_rpi_bracket/2+0.6])
            cube([15,17,1]);
         translate([-wd_rpi_bracket/2-15,15,ht_2_rpi_bracket/2+0.6])
                cube([15,12.5,1]);

    }
    
    //add these to get grooves to fit the two parts
    translate([-wd_rpi_bracket/2-15,ln_rpi_bracket,ht_2_rpi_bracket/2])
            cube([15,10,1]); 
    translate([-wd_rpi_bracket/2-15,15,ht_2_rpi_bracket/2])
                cube([15,11,1]);
}

module draw_rpi_argon_bracket()
{
//Draws the bracket and cuts various holes
    
    difference()
    {

    rotate([0,0,90])
         translate([(wd_rpi_bracket+10+20)/2-side_circuit/2-12,-side_circuit/2-thick_fan-5,-thick_bottom-thick_air_duct-ht_rpi_bracket-10-0]) 
            draw_rpi_bracket();

     //cut two screw holes in the outer wings of the bracket towards tripod screw side to fix top with the bottom and through to the other parts of the bracket
     for(i=[-1,1])
    {
        translate([(i*side_circuit/2-2.5*i), -side_circuit/2-6, -thick_bottom-thick_air_duct])
            rotate ([0,180,0]) screwHole(screw, ht_rpi_bracket-ht_2_rpi_bracket+9, 6, 2);
            //cylinder(h=ht_rpi_bracket-6, d=screw);
        
        translate([(i*side_circuit/2-2.5*i)-3, -side_circuit/2-6-3, -thick_bottom-thick_air_duct-(ht_rpi_bracket+10)+ht_2_rpi_bracket-2])     
        cube([6,6,4]);
    }
    
     //cut two longish screw holes in the outer wings of the bracket towards back focus screw to fix top with the bottom and through to the other parts of the bracket
     for(i=[-1,1])
    {
        hull()
        {
            
            translate([(i*side_circuit/2+4*i), 44-1.8+5+3-2.5, -thick_bottom-thick_air_duct-5.5])
                cylinder(h=6, d=screw);
            translate([(i*side_circuit/2+4*i), 44-1.8+5+2-2.5, -thick_bottom-thick_air_duct-5.5])
                cylinder(h=6, d=screw);
        } 
        hull()
        {
            
            translate([(i*side_circuit/2+4*i), 44-1.8+5+3-2.5, -thick_bottom-thick_air_duct-2.005])
                rotate([0,180,0]) cylinder(h=2, r1=screw/2, r2=3);
            translate([(i*side_circuit/2+4*i), 44-1.8+5+2-2.5, -thick_bottom-thick_air_duct-2.005])
                rotate([0,180,0]) cylinder(h=2, r1=screw/2, r2=3);
        }    
        
        
        
        hull()
        {   
            translate([(i*side_circuit/2+4*i), 44-1.8+5+3-2.5, -thick_bottom-thick_air_duct-(4.005)])
            cube([6,6,2], true);
            translate([(i*side_circuit/2+4*i), 44-1.8+5+2-2.5, -thick_bottom-thick_air_duct-(4.005)])
            cube([6,6,2], true);
        }       
        
    //cuts space for the flat cable
    translate([-(25)/2, -(side_circuit+1)/2-7,-thick_bottom-thick_air_duct-5])
        cube([25, 4, 5]);
    translate([-(25)/2, -(side_circuit+1)/2-7,-thick_bottom-thick_air_duct-15])
        cube([25, 10.5, 10]);    
    
        
    }     

    }


}

module draw_cover_wire_chamber()
{
    difference()
    {
        cube([20,side_fan-29, 3]);
        //bewel the edge to make it easy to insert
        rotate([0, 25, 0])
            translate([-3, 0, -1.0])
                cube([20,side_fan-29, 3]);
        //holes for screws
        //translate([2.5,3.5,0]) cylinder(h=3, d=2.5);
        translate([20-2.5,3.5,0]) cylinder(h=3, d=2.6);
        translate([20-2.5,3.5,0]) cylinder(h=1, d=5);
        //translate([2.5,side_fan-26-3.5,0]) cylinder(h=3, d=2.5);
        translate([20-2.5,side_fan-29-3.5,0]) cylinder(h=3, d=2.6);
        translate([20-2.5,side_fan-29-3.5,0]) cylinder(h=1, d=4.5);
        //hole for wires to some out
        translate([8,(side_fan-29)/2-10, 0]) cube([6,20,3]);
    }
}



// for the scews that I have d2=6mm, h2=2mm, d1=3mm, h1 depents upon length required

module screwHole(d1,h1,d2,h2){
       // d1 diameter bottom of cone and the bolt hole
       // d2 diameter top of cone
       // h1 full height of screw + cone
       // h2 height of cone
    
       // shaft first
      cylinder(d=d1,h=h1);
       // cone second
      translate([0,0,h1-h2]) cylinder(r1=d1/2, r2=d2/2, h=h2);
}
module screwHole2(d1,h1,d2,h2){
       // d1 diameter bottom of cone and the bolt hole
       // d2 diameter top of cone
       // h1 full height of screw + cone
       // h2 height of cone
    
       // shaft first
      //cylinder(d=d1,h=h1);
       // cone second
      translate([0,0,h1-h2]) cylinder(r1=d1/2, r2=d2/2, h=h2);
}


module ball_head_fix()
{

difference()
{
    union()
    {
    hull(){
        cube([length,bottom_width,ht_non_bevelled_from_bottom]);
        translate([0,(bottom_width-top_width)/2,ht_non_bevelled_from_bottom])
            cube([length, top_width,bevelled_part_from_top]);
          };
        translate([0,(bottom_width-top_width)/2,total_height])
            cube([length, top_width,3]);
    hull(){
          translate([(length-width_front)/2,bottom_width/2,0])
            cube([(width_front-bevelled_front)/2,bottom_width/2,non_bevelled_front]);
          translate([(length-width_front)/2,bottom_width/2,non_bevelled_front])
            cube([(width_front-bevelled_front)/2,top_width/2,total_height-non_bevelled_front]);
           }
    hull(){
          translate([length-(length-width_front)/2-(width_front-bevelled_front)/2,bottom_width/2,0])
            cube([(width_front-bevelled_front)/2,bottom_width/2,non_bevelled_front]);
          translate([length-(length-width_front)/2-(width_front-bevelled_front)/2,bottom_width/2,non_bevelled_front])
            cube([(width_front-bevelled_front)/2,top_width/2,total_height-non_bevelled_front]);
           }   
      }    
    translate([0,notch_starts,0])
        cube([(length-width_front)/2, bottom_width-(bottom_width-top_width)/2-1,total_height-thickness_sheet]);
    
    translate([(length+width_front)/2,notch_starts,0])
        cube([(length-width_front)/2, bottom_width-(bottom_width-top_width)/2-1,total_height-thickness_sheet]);
          //screw hole 1
          /*translate([5,bottom_width/4,1])
                cylinder(h=total_height+3-1 , d=screw );
          %translate([5,bottom_width/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,total_height+3-1, 6.2, 2);
          translate([5,bottom_width/4,0])
                cylinder(h=total_height-thickness_sheet+1, d=6.2 );
                //cylinder(h=1, d=6.2); */
      
                translate([5,bottom_width/4,total_height-thickness_sheet+1])
                cylinder(h=thickness_sheet+3-1, d=screw );
          translate([5,bottom_width/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,thickness_sheet+3-1, 6.2, 2);
          translate([5,bottom_width/4,0])
                cylinder(h=total_height-thickness_sheet+1, d=6.2 );
      
          //screw hole 2      
          /*translate([length-5,bottom_width/4,1])
                cylinder(h=total_height+3-1 , d=screw );
          translate([length-5,bottom_width/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,total_height+3-1, 6.2, 2);
          translate([length-5,bottom_width/4,0])
                cylinder(h=1, d=6.2); */
                
          translate([length-5,bottom_width/4,total_height-thickness_sheet+1])
                cylinder(h=thickness_sheet+3-1, d=screw );
          translate([length-5,bottom_width/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,thickness_sheet+3-1, 6.2, 2);
          translate([length-5,bottom_width/4,0])
                cylinder(h=total_height-thickness_sheet+1, d=6.2 );
                
          //screw hole 3
          translate([5,bottom_width*3/4,total_height-thickness_sheet+1])
                cylinder(h=thickness_sheet+3-1, d=screw );
          translate([5,bottom_width*3/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,thickness_sheet+3-1, 6.2, 2);
          translate([5,bottom_width*3/4,0])
                cylinder(h=total_height-thickness_sheet+1, d=6.2 );
          //screw hole 4     
          translate([length-5,bottom_width*3/4,total_height-thickness_sheet+1])
                cylinder(h=thickness_sheet+3-1, d=screw );
          translate([length-5,bottom_width*3/4,total_height+3])
                rotate([0,180,0])
                screwHole2(screw,thickness_sheet+3-1, 6.2, 2);
           translate([length-5,bottom_width*3/4,0])
                cylinder(h=total_height-thickness_sheet+1, d=6.2 );
  }
  }
  
  module roundedcube(xdim, ydim, zdim, rdim) {
    hull(){
        translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);        
    }
}

module raised_edge(len,wd)
{
linear_extrude(len)
polygon(points=[[0,0], [0,2], [wd,0]]);
}