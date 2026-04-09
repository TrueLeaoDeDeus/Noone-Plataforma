if (!alvo) {
	exit;
}

image_alpha = speed/10;
image_xscale = lerp(image_xscale,speed*3,0.1);

image_angle = direction;


// Isso so roda se eu tenho um alvo.
if (voltei==false) {
	speed -= 0.05;
    
    if (speed <=0) {
    	// Avisar que estou voltando.
        voltei = true;
        
        var _x = alvo.x+random_range(-5,5);
        var _y = alvo.y-12+random_range(-4,4);

        var dir = point_direction(x,y,_x,_y);
        direction = dir;
    
    }
}
else {
    
    speed += 0.05;
    
    var cole  = place_meeting(x,y,alvo);
    if (cole) {
    	instance_destroy();
        with (alvo) {
            
            var cor = choose(c_red,c_yellow,c_black);
            
            var forca = random_range(0.3,1);
        	aplica_efeito_brilho(cor,forca);
        }
        
    }
    
    timer--;
    if (timer<=0) {
    	instance_destroy();
        
        //show_message("morri!")
    }
}  

