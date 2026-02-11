/// CREATE EVENT – obj_espada
// posição base do texto
texto_x = x;
texto_y = y;

// nome atual e antigo
nome_atual  = "";
nome_antigo = "";

// animação
old_y_offset = 0;
old_alpha = 0;
animando_nome = false;

// ===== DADOS =====
espada_data = {};

// nomes base
espada_data.base = [
"Excalibur","Durandal","Caliburn","Aegis","Solaria","Umbra","Noctis","Aurora","Eclipse","Valefor",
"Ardent","Nox","Luminis","Tenebris","Helios","Nyx","Khaos","Astra","Vesper","Ignis",
"Fatum","Oblivion","Mythra","Seraph","Inferis","Celes","Umbriel","Ruin","Zephyr","Ashen",
"Vorpal","Crimson","Ivory","Onyx","Grimm","Eon","Hollow","Crown","Revenant","Omen",
"Arcana","Dread","Frostbane","Emberfall","Starpiercer","Voidcall","Sunrender","Nightveil","Worldsplitter","Echoedge"
];

// formas
espada_data.forma = [
"Primeva","Antiga","Esquecida","Profana","Radiante","Sombria","Eterna","Fragmentada","Ascendente","Caída",
"Silenciosa","Viva","Ecoante","Cicatrizada","Desperta","Selada","Instável","Corrompida","Purificada","Transcendente",
"Indomável","Sussurrante","Reforjada","Velada","Abissal","Celestial","Feral","Lacrada","Infinita","Condenada",
"Consagrada","Imortal","Vinculada","Mutável","Gravada","Errante","Adormecida","Sangrenta","Queimada","Congelada",
"Obscura","Vazia","Resplandente","Ruinosa","Partida","Cansada","Impiedosa","Ecoada","Ancestral","Crepuscular"
];

// títulos (só aparecem se fizer sentido)
espada_data.titulo = [
"Lendária","Maldita","Sagrada","Espectral","Imortal","Ancestral","Profética","Oculta","Vigilante","Crepuscular",
"Abissal","Celestial","Errante","Transcendente","Consagrada","Condenada","Silenciosa","Radiante","Sombria","Eterna"
];

// estados (impactam gameplay)
espada_data.estado = [
"Perfeita","Rachada","Quebrada","Instável","Corrompida","Purificada","Desperta","Selada","Consumida","Incompleta",
"Reforjada","Desgastada","Amaldiçoada","Reconstruída","Sobrecarregada","Equilibrada","Ressonante","Enferrujada","Lúcida","Caótica"
];

// ecos narrativos
espada_data.eco = [
"da Luz","do Crepúsculo","do Abismo","da Paisagem Interior","do Vazio","das Cinzas","do Silêncio","da Aurora","da Queda","do Último Dia",
"do Eclipse","do Destino","do Esquecimento","da Memória","do Caos","da Vigília","da Alma","do Julgamento","do Limiar","do Despertar"
];

// ===== RESULTADO =====
espada = {
    nome: "",
    base: "",
    forma: "",
    titulo: "",
    estado: "",
    eco: ""
};

// primeira geração
gerar_espada();
espada.cor = c_white;
