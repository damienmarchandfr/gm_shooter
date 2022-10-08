self.image_angle = point_direction(self.x, self.y, mouse_x, mouse_y);


if(self.image_angle > 90 && self.image_angle < 90 * 3){
	self.image_yscale = -1;
}else{
	self.image_yscale = 1;
}

if(self.firing){
	if(self.firing_interval_counter >= self.firing_interval){
		var bullet_x = self.x + lengthdir_x(40,self.image_angle);	
		var bullet_y = self.y+lengthdir_y(40,self.image_angle);

		var bullet = instance_create_layer(bullet_x,bullet_y,"Instances",obj_bullet);
		bullet.direction = self.image_angle;
		self.firing_interval_counter = 0;
	}else{
		self.firing_interval_counter++;
	}
}

