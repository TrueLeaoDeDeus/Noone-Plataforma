
// nao tem particula.
//ps_porta
ps = part_system_create();
part_system_draw_order(ps, true);

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_cloud);
part_type_size(ptype1, 0, 1, 0, 0.1);
part_type_scale(ptype1, 0.1, 0.1);
part_type_speed(ptype1, 0.1, 0.1, 0, 0);
part_type_direction(ptype1, 300, 100, 0, 4);
part_type_gravity(ptype1, 0.02, 270);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $FFFFFF, $676767, $000000);
part_type_alpha3(ptype1, 1, 1, 0.588);
part_type_blend(ptype1, true);
part_type_life(ptype1, 20, 40);





// Começando sem estado.
estado = "porta_fechado";
// Maquinas de estados.

maquina_de_estado  =function ()
{
    switch (estado) {
    	case "porta_fechado" :
            
           // image_blend = c_red;
            
        break;
        
        case "porta_abrindo":
            // Porta subindo.
            vspeed = -0.3;
            // Tremendo a porta.
            x = xstart + random_range(-1,1);
            // Mudando o estado da porta se ele subiu o suficiente.
            if (y<ystart-33) {
            	estado = "aberta";
               alarm[0]=FPS;
            }
            //Creando particula se nao exite
           //if (!part_system_exists(ps) ) {
            //// Creando a partycula.
        	//ps = part_system_create(ps_porta);
            //// Definindo a posiçao .
            //part_system_position(ps,x,y-sprite_height/2);
            
            // Creando a minha particula manualmente.
            var _x = x + random_range(-sprite_height/1.5,sprite_height/1.5);
            part_particles_create(ps,_x,ystart-sprite_height,ptype1,2);
        
            
            // image_blend = c_blue;
        break;
        
        case "aberta":
             vspeed = 0;
            
            x = xstart;
            //image_blend = c_black;
            
            
        break;
    }
    
    
    
}



