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
// Rwevision 1, changed the touch start to read the object description to set the landing point
// vector LandingPoint = llGetObjectDesc();
// This requires a vector in the objects description <50,52,24>
integer loc_x = 9933;  // Coordinates of the sim
integer loc_y = 9972; // Coordinates of the sim
default
{
    state_entry()
    {
        llSay(0, "Script running");
    }
   
    touch_start(integer _det) {
        key AvatarKey = llDetectedKey(0);
        vector LandingPoint = llGetObjectDesc();
        vector LookAt = <1,1,0>;

        osTeleportAgent(AvatarKey, loc_x, loc_y, LandingPoint, LookAt);
    }
   
    collision(integer _det)
    {
        key AvatarKey = llDetectedKey(0);
        vector LandingPoint = llGetObjectDesc();
        vector LookAt = <1,1,0>;

        osTeleportAgent(AvatarKey, loc_x, loc_y, LandingPoint, LookAt);
    }

} 
