import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/clube.dart';
import '../providers/campeonato_provider.dart';
import 'detalhes_clube_screen.dart';

class TabelaCampeonatoScreen extends StatelessWidget {
  const TabelaCampeonatoScreen({super.key});

  Color _getIndicadorCor(int posicao) {
    if (posicao <= 4) {
      return Colors.blue.shade700;
    }
    else if (posicao <= 12) {
      return Colors.green.shade600;
    }
    else if (posicao >= 17) {
      return Colors.red.shade700;
    }
    return Colors.transparent;
  }

  Widget _buildCabecalho(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: SizedBox()),
          Expanded(flex: 7, child: Text('Clube', style: textStyle)),
          Expanded(flex: 3, child: Center(child: Text('Pts', style: textStyle))),
          Expanded(flex: 2, child: Center(child: Text('PJ', style: textStyle))),
          Expanded(flex: 2, child: Center(child: Text('VIT', style: textStyle))),
          Expanded(flex: 2, child: Center(child: Text('E', style: textStyle))),
          Expanded(flex: 2, child: Center(child: Text('DER', style: textStyle))),
          Expanded(flex: 2, child: Center(child: Text('SG', style: textStyle))),
        ],
      ),
    );
  }

  Widget _buildLinhaClube(BuildContext context, Clube clube) {
    final theme = Theme.of(context);
    final textStyleStats = theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodySmall?.color);
    final textStylePontos = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final textStyleNome = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetalhesClubeScreen(clube: clube)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(width: 4, height: 20, color: _getIndicadorCor(clube.id)),
                    const SizedBox(width: 8),
                    Expanded(child: Text(clube.id.toString(), textAlign: TextAlign.center, style: textStyleStats)),
                  ],
                ),
              ),

              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Image.asset(clube.escudo, width: 28, height: 28, errorBuilder: (c, e, s) => const Icon(Icons.shield)),
                    const SizedBox(width: 10),
                    Flexible(child: Text(clube.nome, style: textStyleNome, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),

              Expanded(flex: 2, child: Center(child: Text(clube.pontos.toString(), style: textStylePontos))),
              Expanded(flex: 2, child: Center(child: Text(clube.jogos.toString(), style: textStyleStats))),
              Expanded(flex: 2, child: Center(child: Text(clube.vitorias.toString(), style: textStyleStats))),
              Expanded(flex: 2, child: Center(child: Text(clube.empates.toString(), style: textStyleStats))),
              Expanded(flex: 2, child: Center(child: Text(clube.derrotas.toString(), style: textStyleStats))),
              Expanded(flex: 2, child: Center(child: Text(clube.saldoGols.toString(), style: textStyleStats))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarraDeBusca(BuildContext context) {
    final provider = context.read<CampeonatoProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Buscar por time',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          provider.filtrar(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CampeonatoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/cbf-logo.png', width: 40, height: 40),
            const SizedBox(width: 16),
            const Text('Brasileirão Série A'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(provider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              context.read<CampeonatoProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildBarraDeBusca(context),
          _buildCabecalho(context),
          const Divider(height: 1),
          if (provider.isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (provider.errorMessage != null)
            Expanded(child: Center(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(provider.errorMessage!, textAlign: TextAlign.center),
            )))
          else
            Expanded(
              child: ListView.builder(
                itemCount: provider.clubesFiltrados.length,
                itemBuilder: (context, index) => _buildLinhaClube(context, provider.clubesFiltrados[index]),
              ),
            ),
        ],
      ),
    );
  }
}


