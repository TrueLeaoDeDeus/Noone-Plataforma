if (keyboard_check_pressed(vk_space))
{
    apelido_atual = gerar_apelido_social(tipo_apelido);

    // animação: texto vem de baixo
    y_texto = room_height * 0.6;
    y_alvo  = room_height * 0.5;
}

// interpolação suave
y_texto = lerp(y_texto, y_alvo, 0.15);
