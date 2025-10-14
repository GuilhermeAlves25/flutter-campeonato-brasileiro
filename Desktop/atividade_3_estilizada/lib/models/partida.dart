class Partida {
  final String nomeMandante;
  final String escudoMandante;
  final String nomeVisitante;
  final String escudoVisitante;
  final int? golsMandante;
  final int? golsVisitante;
  final String info;

  const Partida({
    required this.nomeMandante,
    required this.escudoMandante,
    required this.nomeVisitante,
    required this.escudoVisitante,
    this.golsMandante,
    this.golsVisitante,
    required this.info,
  });
}