if (keyboard_check_pressed(vk_space)) {

    // guarda o nome antigo
    nome_antigo = nome_atual;
    old_y_offset = 0;
    old_alpha = 1;
    animando_nome = true;

    // gera nova espada
    gerar_espada();
    nome_atual = espada.nome;
}
if (animando_nome) {
    old_y_offset -= 1;      // sobe
    old_alpha -= 0.005;      // desaparece

    if (old_alpha <= 0) {
        animando_nome = false;
    }
}
