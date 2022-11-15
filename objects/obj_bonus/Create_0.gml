randomize();

var choices = [
	"firing",
	"speed"
];

var max_index = array_length(choices) - 1;

var bonus = choices[irandom_range(0,max_index)];



switch (bonus)
{
	case "firing":
		self.sprite_index = spr_bonus_firing;
		self.firing_bonus = 1;
		break;
		
	case "speed":
		self.sprite_index = spr_bonus_speed;
		self.speed_bonus = 0.2;
		break;
		

    default:
        break;
} 



