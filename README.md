# OSgrid-ITP
A internal teleport system tried on OSgrid / Open Simulator
This script was taken from the OS_Teleport(Touch & Collision)
created by WhiteStar Magic.

I have made two revisions to this script:
1) changed the touch start to read the object description to
     set the landing point
          vector LandingPoint = llGetObjectDesc();
     This requires a vector in the objects description <50,52,24>

2) Added the following lines so that the actual sim co-ordinates
     are read automatically, this way, the script can just be
     dropped into a object without alteration:
          string loc_vector = (string) (llGetRegionCorner()/256.0);
          string strX = llGetSubString(loc_vector, 1, 4);
          string strY = llGetSubString(loc_vector, 13, 17);
          loc_x = ((integer)strX);
          loc_y = ((integer)strY);
     The codeing used was provided by Lotek Ixtar from OsGrid

If you have any problems, please get in touch amber-marie@hosted-systems.co.uk
