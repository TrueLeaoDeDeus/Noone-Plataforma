/// @function gerar_apelido_social(tipo)
/// @param tipo string
/// tipos válidos:
/// "divertido", "ofensivo", "pervertido", "vergonha", "azarado", "sortudo"

function gerar_apelido_social(_tipo)
{
    // ===== DENOMINAÇÕES HUMANAS =====
    var denominacoes = [
        "Pai","Mãe","Filho","Filha",
        "Neto","Neta",
        "Avô","Avó",
        "Tio","Tia",
        "Sobrinho","Sobrinha",
        "Parente","Herdeiro",
        "Bastardo","Criado"
    ];

    var conectores = ["de","da","do","dos","das"];

    // ===== BASE COMUM =====
    var base_divertido = [
        "Riso Fácil","Sorriso Torto","Tropeço",
        "Piada Velha","Passo Errado",
        "Gargalhada","Bagunça","Confusão"
    ];

    var base_ofensivo = [
        "Erro","Vergonha","Problema",
        "Desastre","Fracasso",
        "Incômodo","Peso","Castigo"
    ];

    var base_pervertido = [
        "Olhar Demorado","Mão Boba",
        "Sorriso Suspeito","Piscadela",
        "Pensamento Sujo","Curioso Demais"
    ];

    var base_vergonha = [
        "Cena Ruim","Gafe","Silêncio Estranho",
        "Momento Errado","Palco Errado",
        "Fracasso Público"
    ];

    var base_azarado = [
        "Pé Frio","Ímã de Problema",
        "Alvo do Destino","Sinal Errado",
        "Última Escolha","Dia Errado"
    ];

    var base_sortudo = [
        "Queridinho","Abençoado",
        "Escolhido","Iluminado",
        "Favorito","Dourado"
    ];

    // ===== COMPLEMENTOS =====
    var complementos = [
        "da Vila","do Bairro","da Família",
        "do Mercado","da Taverna",
        "da Feira","do Caminho",
        "do Destino","do Acaso",
        "do Ano","da História"
    ];

    // ===== ESCOLHA DA BASE =====
    var base;

    switch (_tipo)
    {
        case "divertido":  base = base_divertido; break;
        case "ofensivo":   base = base_ofensivo; break;
        case "pervertido": base = base_pervertido; break;
        case "vergonha":   base = base_vergonha; break;
        case "azarado":    base = base_azarado; break;
        case "sortudo":    base = base_sortudo; break;
        default:           base = base_divertido;
    }

    // ===== MONTAGEM FINAL =====
    var d = choose_array(denominacoes);
    var c = choose_array(conectores);
    var b = choose_array(base);
    var comp = choose_array(complementos);

    // Ex: "Filhinho da Vergonha da Vila"
    return d + " " + c + " " + b + " " + comp;
}
