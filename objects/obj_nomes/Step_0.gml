if (keyboard_check_pressed(vk_space)) {

    // guarda o nome antigo
    nome_personagem_antigo = nome_personagem_atual;
    nome_offset_y = 0;
    nome_alpha = 1;
    animando_nome_personagem = true;

    // gera novo nome
    nome_personagem_atual = gerar_nome_personagem();
}
if (animando_nome_personagem) {
    nome_offset_y -= 1;
    nome_alpha -= 0.03;

    if (nome_alpha <= 0) {
        animando_nome_personagem = false;
    }
}
