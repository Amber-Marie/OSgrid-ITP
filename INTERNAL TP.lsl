// ----------------------------------------------------------------
// Script Title:    OS_Teleport(Touch & Collision)
// Created by:      WhiteStar Magic
// Creation Date:   25/11/2009
// Platforms:
//    OpenSim:       Y, Tested and Operational on OpenSim git# f605d59 - r11575
//
// Revision:        0.3
//
// Conditions:
// Please maintain this header. If you modify the script indicate your
// revision details / enhancements
//
// Support:         NONE
//
// Licensing:       OpenSource.  Do as you will with it!
//
// ================================================================
// Internal TP. Based on OS_Teleport Script by WhiteStar Magic, Modified by Amber-Marie Tracey
//
// Revision 1, changed the touch start to read the object description to set the landing point
//      vector LandingPoint = llGetObjectDesc();
//      This requires a vector in the objects description <50,52,24>
//
// Revision 2, Changed the need to hard code the sim co-ordinates, by using llGetRegionCorner()
//      The advice for this was given by dj phil on the OSgrid forums (https://forums.osgrid.org/viewtopic.php?f=5&t=5934)
//
//
// The latest version can be found at https://github.com/Amber-Marie/OSgrid-ITP
//
integer loc_x;  // Coordinates of the sim
integer loc_y; // Coordinates of the sim
default
{
    // reset script when the object is rezzed
    on_rez(integer start_param)
    {
        llResetScript();
    }
 
    changed(integer change)
    {
        // reset script when the owner or the inventory changed
        if (change & (CHANGED_OWNER | CHANGED_INVENTORY))
            llResetScript();
    }
    
    state_entry()
    {
        llSay(0, "Script running");
    }
   
    touch_start(integer _det) 
    {
        string loc_vector = (string) (llGetRegionCorner()/256.0); // Global location of the south west corner of where the object is
        string strX = llGetSubString(loc_vector, 1, 4); // Split the coordinates into the standard sizes, as standard, the location would be xxxx.00000, yyyy.00000, zzzz.00000
        string strY = llGetSubString(loc_vector, 13, 17); // Split the coordinates into the standard sizes, as standard, the location would be xxxx.00000, yyyy.00000, zzzz.00000
        loc_x = ((integer)strX); //store the cut down values into an integer so that we can use them for the TP
        loc_y = ((integer)strY); //store the cut down values into an integer so that we can use them for the TP
        key AvatarKey = llDetectedKey(0); // Who touched us, and more to the point, who are we moving
        vector LandingPoint = llGetObjectDesc(); // Read the object description to get the actual landing point
        vector LookAt = <1,1,0>; // What direction do we want to face
        llInstantMessage( llDetectedKey(0), "Moving you to the sim at " + loc_x + "," + loc_y + ". Your landing point is at " + (string)LandingPoint);
        osTeleportAgent(AvatarKey, loc_x, loc_y, LandingPoint, LookAt);
    }
   
    collision(integer _det)
    {
        string loc_vector = (string) (llGetRegionCorner()/256.0); // Global location of the south west corner of where the object is
        string strX = llGetSubString(loc_vector, 1, 4); // Split the coordinates into the standard sizes, as standard, the location would be xxxx.00000, yyyy.00000, zzzz.00000
        string strY = llGetSubString(loc_vector, 13, 17); // Split the coordinates into the standard sizes, as standard, the location would be xxxx.00000, yyyy.00000, zzzz.00000
        loc_x = ((integer)strX); //store the cut down values into an integer so that we can use them for the TP
        loc_y = ((integer)strY); //store the cut down values into an integer so that we can use them for the TP
        key AvatarKey = llDetectedKey(0);
        vector LandingPoint = llGetObjectDesc();
        vector LookAt = <1,1,0>;
        llInstantMessage( llDetectedKey(0), "Moving you to the sim at " + loc_x + "," + loc_y + ". Your landing point is at " + (string)LandingPoint);
        osTeleportAgent(AvatarKey, loc_x, loc_y, LandingPoint, LookAt);
    }

} 
