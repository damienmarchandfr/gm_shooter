// Create portal every X sec
alarm_set(0,room_speed*self.spawn_frequency);

// Init camera
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 960;
view_hport[0] = 540;

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 480;
var _ypos = (_dheight / 2) - 270;
window_set_rectangle(_xpos, _ypos, 960, 540);
surface_resize(application_surface, 960, 540);

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 400, 250);

