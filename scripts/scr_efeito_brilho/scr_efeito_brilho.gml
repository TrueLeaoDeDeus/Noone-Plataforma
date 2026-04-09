
// Você usa essa função inincializar  as variaveis nescessárias para o efeito brilho,

function inicia_efeito_brilho()
{
    xscale          = 1;
    yscale          = 1;
    
    dir             = 1;
    alpha_brilho    = 0;
    cor_brilho      =c_white;
}

// Aplicando o efeito de brilho.
// Voce usa essa funçao para fazer ele brilhar.
// Tambem pode definir acor.
// Tambem pode  definir aintencidade .
// 1 e forte e 0 e inexitente.
function aplica_efeito_brilho(_cor =c_white , _valor = 1)
{
    alpha_brilho = _valor;
    cor_brilho = _cor;
} 

// Retornando para a cor original.
// Voce usa essa funçao no step para ele parar de brilhar.
// Pode mudar a velocidade do brilho.
// 1 e instantaneo e 0 e inexistente.
function retorna_efeito_brilho(_vel = 0.1)
{
    alpha_brilho = lerp(alpha_brilho,0,_vel);
}

// funçao usasda para desenhar o efeito brilho.
// Voce deve usar essa funçao DEPOIS de desenhar a sua sprite.
// Tambem pode fazer ela manualmente usando as variavels 
// alpha brilho no alpha e cor brilho no image blend.
function desenha_efeito_brilho()
{
    // So presciso me desenhar se o alpha brilho for maior do que zero.
    if (alpha_brilho<=0) return;
    	shader_set(sh_mudar_cor);
        draw_sprite_ext(sprite_index,image_index,x,y,xscale*dir, yscale,image_angle,cor_brilho,alpha_brilho)
        shader_reset();
    
    
}
