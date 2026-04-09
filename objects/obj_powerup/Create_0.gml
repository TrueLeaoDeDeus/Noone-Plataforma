
alvo = noone;

movendo  = function ()
{
    if (!alvo) {
    	return;
    }
    
    x = alvo.x;
    y = alvo.y-35;
}

// Exploçao de particulas.

explocao = function ()
{
    //Creando emntre 20 a 50 particulas.
    var qtd = irandom_range(20,50);
    repeat (qtd) {
    	var _part = instance_create_layer(x,y,"enfeites",obj_particula_powerup);
        
        _part.speed = random_range(2,4);
        _part.direction = random(359);
        _part.alvo = alvo;
        
    }
}