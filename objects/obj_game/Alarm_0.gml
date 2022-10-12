if(!self.spwan_enemy){
	return
}
var max_spawn_x = room_width;
var max_spawn_y = room_height;

var spawn_x = irandom_range(0,max_spawn_x);
var spawn_y = irandom_range(0,max_spawn_y);

instance_create_layer(spawn_x,spawn_y,"Instances_back",obj_portal);

self.spawn_frequency = self.spawn_frequency - 0.1;
self.spawn_frequency = clamp(self.spawn_frequency,1,10);
alarm_set(0,room_speed*self.spawn_frequency);