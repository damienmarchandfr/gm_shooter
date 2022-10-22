self.x += lengthdir_x(self.speed, direction);
self.y += lengthdir_y(self.speed, direction);

var tilemap_ground = layer_tilemap_get_id("Tiles_Collisions");
var current_tile = tilemap_get_at_pixel(tilemap_ground, self.x, self.y);
var tile_index = tile_get_index(current_tile);

if(tile_index == 1){
	instance_destroy();
}
