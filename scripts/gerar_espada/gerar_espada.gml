function gerar_espada()
{
    // limpa
    espada.nome   = "";
    espada.titulo = "";
    espada.estado = "";
    espada.eco    = "";

    // base obrigatória
    espada.base  = choose_array(espada_data.base);
    espada.forma = choose_array(espada_data.forma);

    // título só se espada não estiver quebrada
    if (irandom(100) < 55) {
        espada.titulo = choose_array(espada_data.titulo);
    }

    // estado
    if (irandom(100) < 50) {
        espada.estado = choose_array(espada_data.estado);
    }

    // eco sempre por último
    if (irandom(100) < 70) {
        espada.eco = choose_array(espada_data.eco);
    }

    // ===== MONTAÇÃO FINAL =====
    if (espada.titulo != "") {
        espada.nome += espada.titulo + " ";
    }

    espada.nome += espada.base + " " + espada.forma;

    if (espada.estado != "") {
        espada.nome += " " + espada.estado;
    }

    if (espada.eco != "") {
        espada.nome += ", " + espada.eco;
    }
    
     // ===== DEFINIÇÃO DE COR (RARIDADE RPG) =====
   espada.cor = c_white; // Normal
   
   // Incomum
   if (espada.estado == "Reforjada" || espada.estado == "Equilibrada") {
       espada.cor = c_green;
   }
   
   // Raro
   if (espada.titulo == "Ancestral" || espada.titulo == "Celestial") {
       espada.cor = c_blue;
   }
   
   // Épico
   if (espada.estado == "Corrompida" || espada.titulo == "Maldita") {
       espada.cor = c_purple;
   }
   
   // Lendário
   if (espada.titulo == "Lendária") {
       espada.cor = make_color_rgb(255, 215, 100);
   }
   
   // Perfeita + Lendária (destaque máximo)
   if (espada.titulo == "Lendária" && espada.estado == "Perfeita") {
       espada.cor = make_color_rgb(255, 235, 160);
   }

}
