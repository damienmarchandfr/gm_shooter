self.gun.x = self.x;
self.gun.y = self.y;

if(place_meeting(self.x,self.y,obj_small_enemy)){
	self.image_alpha = 0.5;
	self.gun.image_alpha = 0.5;
}