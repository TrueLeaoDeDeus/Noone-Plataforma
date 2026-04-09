if (alvo==noone) {
    
	other.ativa_power_up();

    alvo = other.id;

    movendo();
    
    explocao();
    
    other.powerup = true;

}
