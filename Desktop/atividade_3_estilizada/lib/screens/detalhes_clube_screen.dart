import 'package:flutter/material.dart';
import '../models/clube.dart';

class DetalhesClubeScreen extends StatelessWidget {
  final Clube clube;
  const DetalhesClubeScreen({super.key, required this.clube});

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        children: [
          Image.asset(clube.escudo, width: 60, height: 60, errorBuilder: (c, e, s) => const Icon(Icons.error, size: 60)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clube.nome, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text(
                  '${clube.id}º lugar Brasileirão Série A',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final stats = {
      'Pontos': clube.pontos.toString(),
      'Jogos': clube.jogos.toString(),
      'Vitórias': clube.vitorias.toString(),
      'Empates': clube.empates.toString(),
      'Derrotas': clube.derrotas.toString(),
      'Gols Pró': clube.golsPro.toString(),
      'Gols Contra': clube.golsContra.toString(),
      'Saldo': clube.saldoGols.toString(),
    };

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: stats.entries.map((entry) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(entry.value, style: Theme.of(context).textTheme.titleLarge),
            Text(entry.key, style: Theme.of(context).textTheme.bodySmall),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTitlesSection() {
    return clube.titulos.isEmpty
        ? const Text('Nenhum título brasileiro registrado.', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey))
        : Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: clube.titulos.map((ano) {
        return Chip(
          label: Text(ano.toString()),
          backgroundColor: Colors.grey.shade800,
          labelStyle: const TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),

              _buildSectionCard(
                context: context,
                title: 'Estatísticas da Temporada',
                content: _buildStatsGrid(context),
              ),

              const SizedBox(height: 24),

              _buildSectionCard(
                context: context,
                title: 'Histórico de Títulos Brasileiros',
                content: _buildTitlesSection(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}