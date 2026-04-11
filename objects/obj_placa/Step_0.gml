// Checando se eu coledi com o player.

var _cole_player = place_meeting(x,y,obj_player);

// Se eu coledir com o player.
if (_cole_player)
{
	
    // Se eu nao tenho caixa de lialogo eu crio um.
    if (!instance_exists(minha_caixa_dialogo))
    {
        // Criando caixa de dialogo.
        minha_caixa_dialogo =  instance_create_layer(x,y-30,"dialogo",obj_caixa_dialogo);
        minha_caixa_dialogo.image_alpha = 0.8;
        minha_caixa_dialogo.image_xscale = 0.1;
        minha_caixa_dialogo.texto = texto;
    }
    
}
else 
{
    
    if (instance_exists(minha_caixa_dialogo)){
        minha_caixa_dialogo.posso_destruir()
  }
}