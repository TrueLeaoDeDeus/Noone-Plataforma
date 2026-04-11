texto = "Escreva o texto ";
desenhar_texto = false;

estado = noone;


estado_deformar = function()
{
    // Fazendo ele esticar.

   image_xscale = lerp(image_xscale,2.5,0.1);
   
   // Fazendo ele subir um pouco.
   
   y = lerp(y,ystart-30,0.07);
   
   // Checando se o Y chegou o suficiente da posiçao final dele.
   
   if (y <= ystart -29) {
   	desenhar_texto = true;
   }

}
posso_destruir = function ()
{
    // Fazendo ele ficar menor.
    image_xscale  =lerp(image_xscale,0,0.05); 
    image_yscale  =lerp(image_yscale,0,0.05);   
    
    // Fazendo ele decer.
    y = lerp(y,ystart+30,0.1);
    
    image_alpha -= 0.03;
    
    desenhar_texto = false;
    
    if (image_yscale <=0.3 ) {
    	
        image_alpha = 1;
        instance_destroy();
        
        //show_message("foi");
    }
}

estado = estado_deformar;