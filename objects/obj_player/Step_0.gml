self.gun.x = self.x;
self.gun.y = self.y;

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