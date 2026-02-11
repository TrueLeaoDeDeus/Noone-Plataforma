// nome antigo subindo
if (animando_nome) {
    draw_set_alpha(old_alpha);
    draw_set_color(espada.cor);
    draw_text(texto_x, texto_y + old_y_offset, nome_antigo);
}

// nome atual fixo
draw_set_alpha(1);
draw_set_color(espada.cor);
draw_text(texto_x, texto_y, nome_atual);

// reset obrigatório
draw_set_alpha(1);
draw_set_color(c_white);


