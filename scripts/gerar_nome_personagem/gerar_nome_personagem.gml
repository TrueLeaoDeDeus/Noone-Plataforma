function gerar_nome_personagem()
{
    var nomes = [
        // curtos / fortes
        "Ael","Bel","Cor","Dra","El","Fen","Gal","Ka","Lor","Mor",
        "Na","Or","Ral","Ser","Tha","Ul","Va","Xan","Yor","Zel",

        // suaves / místicos
        "Ae","Eli","Ira","Lune","Sae","Nym","Eon","Ari","Syl","Noa",

        // ásperos / tribais
        "Krag","Bor","Thok","Ruk","Zar","Grim","Vor","Drak","Karn","Mok",

        // elegantes / antigos
        "Alar","Eld","Vael","Caer","Ith","Oryn","Sael","Maer","Lior","Amon"
    ];

    var sobrenomes = [
        // clássicos
        "mir","thar","ion","rak","el","wyn","tos","kan","var","reth",
        "mon","sil","dren","fal","nar","xis","ven","lor","zar","dae",

        // poéticos
        "lume","eth","ael","orin","essa","anor","iel","ir","une","ae",

        // brutais
        "skull","fang","blood","ash","scar","bone","iron","maw","claw","wrath",

        // nobres / arcaicos
        "Valen","Noctis","Aurel","Draven","Caelum","Erevan","Thorne","Iskandar"
    ];

    var apelidos = [
        // abstratos
        "Cinza","Eco","Véu","Vazio","Marca","Ruína","Fragmento","Juramento",

        // animais / instinto
        "Lobo","Corvo","Serpente","Cervo","Urso","Gato","Falcão","Hiena",

        // elementos
        "Brasa","Chama","Gelo","Tempestade","Pó","Pedra","Raiz","Onda",

        // estados / conceitos
        "Errante","Mudo","Partido","Esquecido","Último","Vigilante",
        "Imóvel","Cansado","Sem-Rosto","Desperto",

        // simbólicos / épicos
        "Coroa","Espinho","Abismo","Farol","Fenda","Cicatriz",
        "Limiar","Eclipse","Crepúsculo","Aurora"
    ];

    var nome = choose_array(nomes);
    var sobrenome = choose_array(sobrenomes);
    var apelido = choose_array(apelidos);

    return nome + " " + sobrenome + " \"" + apelido + "\"";
}
