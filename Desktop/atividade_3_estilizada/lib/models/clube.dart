class Clube {
  final int id;
  final String nome;
  final String escudo;
  final int pontos;
  final int jogos;
  final int vitorias;
  final int empates;
  final int derrotas;
  final int golsPro;
  final int golsContra;
  final int saldoGols;
  final List<int> titulos;

  const Clube({
    required this.id,
    required this.nome,
    required this.escudo,
    required this.pontos,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.golsPro,
    required this.golsContra,
    required this.saldoGols,
    required this.titulos,
  });


  factory Clube.fromMap(Map<String, dynamic> map) {
    return Clube(
      id: map['id'],
      nome: map['nome'],
      escudo: map['escudo'],
      pontos: map['pontos'],
      jogos: map['jogos'],
      vitorias: map['vitorias'],
      empates: map['empates'],
      derrotas: map['derrotas'],
      golsPro: map['golsPro'],
      golsContra: map['golsContra'],
      // Calcula o saldo de gols para garantir consistência
      saldoGols: map['golsPro'] - map['golsContra'],
      // Converte a lista de títulos para uma lista de inteiros
      titulos: List<int>.from(map['titulos']),
    );
  }
}