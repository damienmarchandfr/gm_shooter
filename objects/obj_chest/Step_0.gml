/*
var stop_animation = (self.sprite_index == spr_chest_open && self.image_index == 2);

if(stop_animation){
	self.image_speed = 0;
}

if(place_meeting(self.x,self.y,obj_bullet) && self.health > 0){
	self.health = self.health - obj_bullet.damage;
	instance_destroy(obj_bullet);

	// Start animation
	if(self.sprite_index != spr_chest_open){
		self.sprite_index = spr_chest_hit;
	}
}


if(self.health <= 0 && !stop_animation){
	self.sprite_index = spr_chest_open;
}
*/


if(place_meeting(self.x,self.y,obj_bullet) && self.health > 0){
	self.health = self.health - obj_bullet.damage;
	instance_destroy(obj_bullet);
}

if(self.health <=0){
	self.sprite_index = spr_chest_open;
	self.image_index = 2;
	
	// Create bonus
	if(!self.content_out){
		instance_create_layer(self.x,self.y,"Instances",obj_bonus);
		self.content_out = true;
	}
}

