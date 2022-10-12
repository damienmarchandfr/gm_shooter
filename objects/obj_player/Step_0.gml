self.gun.x = self.x;
self.gun.y = self.y;

enum enum_ground_tile_indexes 
{
	floor = 1,
	water = 2,
	lava = 3,
	wall = 4
}

if(place_meeting(self.x,self.y,obj_small_enemy) && !self.is_invincible){
	self.image_alpha = 0.5;
	self.gun.image_alpha = 0.5;
	
	self.health = self.health - 10;
	self.is_invincible = true;
	self.invincible_counter = 0;
}

if(self.invincible_counter < 60){
	self.invincible_counter++;
}else{
	self.is_invincible = false;
	self.invincible_counter = 0;
	self.image_alpha = 1;
	self.gun.image_alpha = 1;
}

var tilemap_ground = layer_tilemap_get_id("Tiles_Ground");
var current_tile = tilemap_get_at_pixel(tilemap_ground, self.x, self.y);
var tile_index = tile_get_index(current_tile);
show_debug_message(tile_index);

if(tile_index == enum_ground_tile_indexes.floor){
	show_debug_message("On floor");

}