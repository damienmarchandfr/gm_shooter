if(!self.spwan_enemy){
	return
}
var max_spawn_x = room_width;
var max_spawn_y = room_height;


var can_spawn = false;
var spawn_x = 0;
var spawn_y = 0;

// Find a point not in a wall to spawn portal
var collisions_tilemap = layer_tilemap_get_id("Tiles_Collisions");
while(!can_spawn){
	spawn_x = irandom_range(0,max_spawn_x);
	spawn_y = irandom_range(0,max_spawn_y);
	
	var tile = tilemap_get_at_pixel(collisions_tilemap, spawn_x, spawn_y);
	var tile_index = tile_get_index(tile);
	
	if(tile_index != 1){
		can_spawn = true;
	}
}

instance_create_layer(spawn_x,spawn_y,"Instances_back",obj_portal);

self.spawn_frequency = self.spawn_frequency - 0.1;
self.spawn_frequency = clamp(self.spawn_frequency,1,10);
alarm_set(0,room_speed*self.spawn_frequency);