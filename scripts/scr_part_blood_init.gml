{
    global.pt_blood = part_type_create();
    var pt = global.pt_blood;
    
    //Settings
    part_type_shape(pt, pt_shape_disk);
    part_type_size(pt, .05, .1, 0, 0);
    part_type_color2(pt, c_red, c_fuchsia);
    part_type_speed(pt, 4, 10, -.1, 0);
    part_type_direction(pt, 0, 360, 0, 0);
    part_type_gravity(pt, .10, 270);
    part_type_life(pt, 2, 5);
}