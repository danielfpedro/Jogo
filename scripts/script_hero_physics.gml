var k_right = keyboard_check(vk_right);
var k_left = keyboard_check(vk_left);
var k_jump = keyboard_check(vk_space);

var k_dash = keyboard_check(vk_shift);

if (place_meeting(x, y + 1, obj_solid_block)){
    VSPEED = 0;
    on_ground = 1;
    //Jumping
} else{
    on_ground = 0;
    VSPEED += GRAV;
}

// Jump
if(k_jump && on_ground){
    VSPEED = -JUMP_SPEED - (abs(HSPEED) * .3);
    jumping = 1;
}
//Moving
if (keyboard_check(vk_left)) {
    if (HSPEED <= 0) {
        if (HSPEED > -MAX_RUN_SPEED) {
            HSPEED -= ACCELERATION;
        } else {
           HSPEED = -MAX_RUN_SPEED;
        }
    }
    side = 0;
}
if (keyboard_check(vk_right)) {
    if (HSPEED >= 0) {
        if (HSPEED < MAX_RUN_SPEED) {
            HSPEED += ACCELERATION;
        } else {
           HSPEED = MAX_RUN_SPEED;
        }
    }
    side = 1;
}
//Breaking
if ((!k_left && !k_right) || (k_left && k_right)){
    if (HSPEED >= DRAG) {
        HSPEED -= DRAG;
    } else if(HSPEED <= -DRAG){
        HSPEED += DRAG;
    } else {
        HSPEED = 0;
    }
}

//Horizontal collision
if (place_meeting(x + HSPEED, y, obj_solid_block)) {
    while(!place_meeting(x + sign(HSPEED), y, obj_solid_block)){
        x += sign(HSPEED);
    }
    HSPEED = 0;
}
x += HSPEED;

//Vertical collision
if (place_meeting(x, y + VSPEED, obj_solid_block)) {
    while(!place_meeting(x, y + sign(VSPEED), obj_solid_block)){
        y += sign(VSPEED);
    }
    VSPEED = 0;
}
y += VSPEED;