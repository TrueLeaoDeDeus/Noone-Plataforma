// nome antigo subindo
if (animando_nome_personagem) {
    draw_set_alpha(nome_alpha);
    draw_set_color(c_gray);
    draw_text(nome_x, nome_y + nome_offset_y, nome_personagem_antigo);
}

// nome atual
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(nome_x, nome_y, nome_personagem_atual);

// reset obrigatório
draw_set_alpha(1);
draw_set_color(c_white);

