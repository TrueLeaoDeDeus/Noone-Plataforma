draw_self();

// Se eu nao devo desenhar o texto saio do evento.

if (!desenhar_texto)  exit;
 
// Dedinindo a fonte. 
draw_set_font(fnt_caixa_dialogo);
draw_set_halign(0);
draw_set_valign(0);

var _marg = 5;
var _x = x - sprite_width/2;
var _larg = (sprite_width*10)-(_marg*20);
draw_text_ext_transformed(_x+_marg,y+_marg,texto,70,_larg,.1,.1,0);

//draw_set_valign(0);
//draw_set_halign(-);
draw_set_font(-1);