// Variaveis do estados.

estado = noone;

timer = tempo;


// Metodo.

contador_estado = function(estado_destino = estado_tangivel)
{
    timer--;
    if (timer<=0) {
        timer = tempo;
    	estado = estado_destino;
    }
}


// Creando os estados.
estado_tangivel = function()
{
    // Ficar parado na primeira imagem.
    image_index = 0;
    
    // Recuperando a mascara de coliçao.
     mask_index = spr_dado;
    
    // Contando o tempo para mudar de estado.
    // Mudando de estado depois de um tempinho.
    contador_estado(muda_intagivel);
}

muda_intagivel = function()
{
    //show_message("mudei");
    
    // Se terminou a animaçao muda estado.
    if (image_index>=8) {
    	estado = estado_intangivel;
    }
}

estado_intangivel = function()
{
    // Ficar parado na 8 imagem.
    image_index = 8;
    
    // Quando estou no x troco para mascara de coliçao vasio.
    mask_index = spr_vasio;
    
    contador_estado(muda_tangivel);
}

muda_tangivel = function()
{
     if (image_index >= image_number-1) {
    	estado = estado_tangivel;
    }
}

estado = estado_tangivel;
// Se  o estado inicial for x eu coloco ele no x.
if (estado_inicial == "estado_intangivel") {
	estado = estado_intangivel;
}
