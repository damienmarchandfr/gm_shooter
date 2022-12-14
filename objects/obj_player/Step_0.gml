var collisions_tilemap = layer_tilemap_get_id("Tiles_Collisions"); 

self.gun.x = self.x;
self.gun.y = self.y;

// UP/RIGHT/DOWN/LEFT
var collision_points = [
	{
		x: self.x,
		y: self.y + abs(sprite_height)/4 - 5
	},
	{
		x: self.x + abs(sprite_width) / 4,
		y: self.y + abs(sprite_height) / 3 - 5
	},
	{
		x: self.x,
		y: self.y + abs(sprite_height) /3
	},
	{
		x: self.x - abs(sprite_width) / 4,
		y: self.y + abs(sprite_height) / 3 - 5
	}
];


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

if(self.move_up && self.can_move_up){
	for(var i=0;i<array_length(collision_points);i++){
		collision_points[i].y  -= self.move_speed;
	}
}
if(self.move_right && self.can_move_right){
	for(var i=0;i<array_length(collision_points);i++){
		collision_points[i].x  += self.move_speed;
	}
}
if(self.move_down && self.can_move_down){
	for(var i=0;i<array_length(collision_points);i++){
		collision_points[i].y += self.move_speed;
	}
}
if(self.move_left && self.can_move_left){
	for(var i=0;i<array_length(collision_points);i++){
		collision_points[i].x -= self.move_speed;
	}
}


if(!array_length(self.points)){
	for(var i=0;i<array_length(collision_points);i++){
		var inst = instance_create_layer(collision_points[i].x,collision_points[i].y,"Points",obj_point);
		array_push(self.points,inst);
	}
}else{
	for(var i=0;i<array_length(self.points);i++){
		self.points[i].x = collision_points[i].x;
		self.points[i].y = collision_points[i].y;
	}
}

for(var i=0;i<array_length(collision_points);i++){
	var tile = tilemap_get_at_pixel(collisions_tilemap, collision_points[i].x, collision_points[i].y);
	var tile_index = tile_get_index(tile);
	
	if(i==0){
		self.can_move_up = tile_index != 1;
	}
	if(i==1){
		self.can_move_right = tile_index != 1;
	}
	if(i==2){
		self.can_move_down = tile_index != 1;
	}
	if(i==3){
		self.can_move_left = tile_index != 1;
	}
}

var y_speed = 0;
var x_speed = 0;

if(self.move_up && self.can_move_up){
	y_speed = -self.move_speed;
}
if(self.move_right && self.can_move_right){
	x_speed = self.move_speed;
}
if(self.move_down && self.can_move_down){
	y_speed = self.move_speed
}
if(self.move_left && self.can_move_left){
	x_speed = -self.move_speed;
}

// Diagonal ?
var diag_move = y_speed != 0 && x_speed != 0;

if(diag_move){
	x_speed = round(x_speed * ((sqrt(2)) / 2));
	y_speed = round(y_speed * ((sqrt(2)) / 2));
}

self.x += x_speed;
self.y += y_speed;

// Bonus collision
if(place_meeting(self.x,self.y,obj_bonus)){
	self.move_speed += obj_bonus.speed_bonus;
	self.gun.firing_interval -= obj_bonus.firing_bonus;
	
	if(self.gun.firing_interval <= 0){
		self.gun.firing_interval = 1;
	}
}


