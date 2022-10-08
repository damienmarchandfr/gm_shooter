var player = obj_player;

if(self.image_alpha <= 1){
	self.image_alpha += 0.04;
}else{
	self.image_alpha = 1;
}

if(place_meeting(self.x,self.y,obj_bullet)){
	self.dead = true;
	// Destroy the bullet
	var _inst = instance_place(self.x, self.y, obj_bullet);
	if _inst != noone
	{
	    instance_destroy(_inst);
	}
}


if(player && !self.dead){
	var player_direction = point_direction(self.x,self.y,player.x,player.y);
	self.x += lengthdir_x(self.move_speed, player_direction);
    self.y += lengthdir_y(self.move_speed, player_direction);
	
	if(self.x >= player.x){
		self.image_xscale = -1;
	}else{
		self.image_xscale = 1;
	}
	
}else{
	// change animation
	if(self.dead_animation_counter <= self.dead_animation_duration){
		self.sprite_index = spr_small_enemy_dead;
		self.image_alpha = 0.8;
		self.dead_animation_counter++;
	}else{
		instance_destroy();
	}
}

