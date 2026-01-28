
#region VARIAVEIS.

vel_h       = 0;
max_vel_h   = 2;
vel_v       = 0;
max_vel_v   = 6;    // Pulo.
grav        = 0.2;  // Gravidade.

estado_atual = " ";

// Variavel do level.
chao = false;

// VAriaveis de inpust.

jump        = false;
down        = false;
left        = false;
right       = false;

// Variaveis da minha lista de coliçoes.
// Pegando minha leyer.
var _leyer = layer_tilemap_get_id("tl_level");

colisoes = [obj_parede,_leyer];

view_player = noone;

// Variaveis do estados
estado      = noone;
#endregion

#region METODOS.
// Metodo para pegar inputs.
pega_iputs              = function()
{
    jump      = keyboard_check_pressed(vk_space);

    down      = keyboard_check(ord("W"));
        
    left      = keyboard_check(ord("A"));  
        
    right     = keyboard_check(ord("D"));
    
    paint     = keyboard_check_pressed(ord("E"));  
}

checa_chao              = function ()
{
    chao = place_meeting(x,y+1,colisoes);
    // Se eu nao estou no chao aplico a minha velocidade.
    if(!chao) // SE eu NÃO estou no chao.
    {
        vel_v+= grav;
        
    }
    else // Estou no chao.
    { 
        vel_v = 0; // Zerando a velocidade.
        y = round(y);
        
        if (jump)
        {
        	vel_v = -max_vel_v;
        }
    }
    

    
}

 troca_sprite           = function(_sprite = spr_parede)
{
    // Checando se eu ainda não estou com a sprite correta.
    if (sprite_index != _sprite)
    {   
        // Troca sprite.
        sprite_index = _sprite;
        // Zero a animação.
        image_index = 0;
    }

    
}

acabou_animacao         = function()
{
    var _spd = sprite_get_speed(sprite_index)/ FPS;
    if (image_index + _spd >= image_number) 
    {
    	return true;
    } 
}

// Metodos dos estados.
estado_parado           = function()
{
    estado_atual = "es_parado";
    // Codigo.
    // logica.
    // Do estado parado. 
    
    // Trocando a sprite.
    troca_sprite(spr_pleyer_idle);
    
    //image_blend = c_red; // Pintando o player de vermelho.
    
    
     
    // Se eu apertar para direita ou esquerda mudar para o estado movendo.
    if (left xor right)
    {
    	estado = estado_movendo;
    }
    
    if (jump)
    {
        instance_create_depth(x,y,depth-1,obj_pulo_particula);
    	estado = estado_pulando;
    }
    
    if (!chao)
    {
    	estado = estado_pulando;
    }
    
    // Se eu apertar E mudar para estado entrando tinta.
    if (paint) 
    {
    	estado = estado_entrando_tinta;
        
    }
}

ajusta_escala = function ()
{
    // Se a velocidade horizontal for diferente de 0 altera a imagem escala no X usando SIGN com velocidade horizontal.
    if (vel_h != 0)
    {
        image_xscale = sign(vel_h);
    }
}

estado_movendo          = function()
{
    estado_atual = "es_movendo";
    // Codigo.
    // Logica.
    // Do estado movendo.
        // Eu não mudei a sprite ainda.
    // Eu nao estou usando a sprite correta.
    //show_message(sprite_get_name(sprite_index));
    
    aplica_velocidade();
    
    troca_sprite(spr_player_move);
    
    
    //image_blend = c_blue;
    
    if (jump)
    {
    	estado = estado_pulando;
    }
   
        // Se eu nao estou me movendo , estou parado?.a
    if (vel_h== 0)
    {
    	estado =  estado_parado;
    }
    
     if (paint) 
    {
    	estado = estado_entrando_tinta;
        
    }
}

estado_pulando          = function()
{
    estado_atual = "es_pulando";
    // Codigo.
    // Logica.
    // Do estado pulando.
    //image_blend = c_yellow;
    
    
    aplica_velocidade();
    // Mudando o estado para estado_parado , quando?
    // Se eu nao me mover para esquerda ou direita (estou parado?) e se eu estiver caindo ?
    
    if (vel_v<0)// estou subindo?
    { 
        troca_sprite(spr_player_jump_cima);
       
        // show_debug_message(" fiu");
    }
    else // estou caindo?
    {
        troca_sprite(spr_player_jump_baixo)
        //show_message("onde?");
       // show_debug_message("poin");
            // Limitando a velocidade de queda do player.
         vel_v = clamp(vel_v,-max_vel_v,max_vel_v);
    }
    
   
    if(chao) 
    {
        estado = estado_parado;
        // instanceando particula no pulo.
        instance_create_depth(x,y,depth-1,obj_pousar_particula);
    }
    
     

}

estado_powerup_inicio   = function ()
{
    estado_atual = "es_pow_inic";
    troca_sprite(spr_player_powerup_inicio);
    
    var _spd = sprite_get_speed(sprite_index) / FPS;
    // Trocando o estado quando estiver no final da animação.
    if (image_index + _spd>= image_number)
    {   // troca estado.
    	estado = estado_powerup_meio;
        //show_debug_message("1");
    }
}

estado_powerup_meio     = function()
{
    estado_atual = "es_pow_meio";
    troca_sprite(spr_player_powerup_meio);
     var _spd = sprite_get_speed(sprite_index) / FPS;
    // Trocando  o estado no final da animação.
    if (acabou_animacao())
    {
    	estado = estado_powerup_fim;
    }
} 

estado_powerup_fim      = function()
{   
    estado_atual = "es_pow_fin";
    // No final da animação vai para o estado parado.
    troca_sprite(spr_player_powerup_fim);
    if (acabou_animacao()) 
    {   
        estado = estado_parado;
        //show_debug_message("3");
    }   
    
    
}  

estado_entrando_tinta   = function ()
{   
    estado_atual = "es_ent_tinta";
    // Trocando a sprite.
    troca_sprite(spr_player_tinta_entrar);

    if (!instance_exists(obj_pulo_entrar_particula)) 
    {
    	// Criando particulas quanado entra na tinta.
         instance_create_depth(x,y,depth-1,obj_pulo_entrar_particula);
    }
    
    if (acabou_animacao()) 
    {   // Mudando o estado no final da animação.
    	estado = estado_tinta_loop;
    }
} 

estado_tinta_loop = function () 
{   
    estado_atual = "es_tin_loop";

    // Em tinta não cai
    vel_v = 0;

    troca_sprite(spr_player_tinta_loop);

    // Primeiro calcula a velocidade
    vel_h = (right - left) * max_vel_h;
    ajusta_escala();

    // Agora testa corretamente
    if (place_meeting(x + (vel_h*8), y + 1, colisoes))
    {
        move_and_collide(vel_h, 0, colisoes, 24);
    }
    else
    {
        vel_h = 0;
    }

    // Sair da tinta
    if (paint)
    {
        estado = estado_saindo_tinta;
        instance_create_depth(x, y, depth - 1, obj_pulo_sair_particula);
    }
}


estado_saindo_tinta     = function ()
{   
    estado_atual = "es_saindo_tinta";
    //trocando a sprite.
    troca_sprite(spr_player_tinta_sair);

    if (acabou_animacao()) 
    {   // Mudando o estado no final da animação.
    	estado = estado_parado;
    }
}
// Metodo de movimentação.
aplica_velocidade       = function ()
{
    //checa_chao();
    // Aplicando agravidade.
    // Aplicando os inputs no vel_h.
    vel_h = (right-left)*max_vel_h;
    
    // Usando o move and collide.
    move_and_collide(vel_h,0,colisoes,24);
    
    move_and_collide(0,vel_v,colisoes,24);
    
    ajusta_escala();
}

#endregion

#region Debug.
roda_debud = function ()
{
    view_player = dbg_view("View_player", 1, 60, 100, 240, 260);
    show_debug_overlay(global.debug);

    // === FÍSICA ===
    dbg_watch(ref_create(id, "vel_v"),     "vel_v");
    dbg_watch(ref_create(id, "vel_h"),     "vel_h");
    dbg_watch(ref_create(id, "grav"),      "grav");
    dbg_watch(ref_create(id, "max_vel_v"), "max_vel_v");
    dbg_watch(ref_create(id, "max_vel_h"), "max_vel_h");

    // === CHÃO ===
    dbg_watch(ref_create(id, "chao"), "No chao");

    // === INPUT ===
    dbg_watch(ref_create(id, "jump"),  "jump");
    dbg_watch(ref_create(id, "down"),  "down");
    dbg_watch(ref_create(id, "left"),  "left");
    dbg_watch(ref_create(id, "right"), "right");
    dbg_watch(ref_create(id, "paint"), "paint");

    // === ESTADO ===
    dbg_watch(ref_create(id, "estado_atual"), "estado_atual");
    dbg_watch(ref_create(id, "estado"),       "estado (func)");

    // === SLIDERS (SÓ CONSTANTES) ===
    dbg_slider(ref_create(id, "grav"),      0, 1,  "grav",      0.01);
    dbg_slider(ref_create(id, "max_vel_v"), 0, 10, "max_vel_v", 0.1);
    dbg_slider(ref_create(id, "max_vel_h"), 0, 10, "max_vel_h", 0.1);
}

ativa_debug             = function ()
{
    // Se o jogo não está no modo debug , ele não faz nada do debug.
    if (!DEBU_MODE) return;
    // Alternando o estado de debug.
   if(keyboard_check_released(vk_tab))
   {
       // Se o sebug e true ele fira false , se  e false vira true.
        global.debug = !global.debug;
        //show_debug_message(global.debug);
        
        // So roda se tiver em modo debug.
        if(global.debug)
        {
            // rodando meu deub.
            roda_debud();
        }
        else 
        {
            // Desativo o debug overley.
            show_debug_overlay(0);
        	if(dbg_view_exists(view_player)) dbg_view_delete(view_player);
        }
        
   }
    
}
#endregion


// As últimas coisa que eu faço no meu create.
// Definindo o estado inicial do plater.
estado = estado_parado;