self.visible = true;
if(self.image_xscale < 1){
		self.image_xscale+=0.01;
		self.image_yscale+=0.01;
		self.image_alpha+=0.01
}else{
	self.image_alpha= 1;
	self.image_xscale = 1;
	self.image_yscale = 1;
}

if(self.image_xscale == 1){
	if(self.spawn_timer <= spawn_frequency){
		self.spawn_timer++;
	}else{
		self.spawn_timer = 0;
		instance_create_layer(self.x,self.y,"Instances",obj_small_enemy);
	}
}