// Se eu tenho um alvo vou começar a ficar transparente.
if (alvo) {
	image_alpha-= 0.01;
    if (image_alpha<=0) {
    	instance_destroy();
        //show_message("Morri!")
    }
}