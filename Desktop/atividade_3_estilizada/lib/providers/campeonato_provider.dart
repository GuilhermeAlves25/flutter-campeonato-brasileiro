import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/clube.dart';

class CampeonatoProvider extends ChangeNotifier {
  List<Clube> _clubes = [];
  bool _isLoading = true;
  String? _errorMessage;
  String _filtro = '';

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  List<Clube> get clubesFiltrados => _clubes.where((clube) {
    final nomeClube = clube.nome.toLowerCase();
    final filtroBusca = _filtro.toLowerCase();
    return nomeClube.contains(filtroBusca);
  }).toList();

  CampeonatoProvider() {
    _carregarDadosDosAssets();
  }
  Future<void> _carregarDadosDosAssets() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/tabela.json');
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      final List<dynamic> timesJson = jsonResponse['times'];

      _clubes = timesJson.map((json) => Clube.fromMap(json)).toList();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Falha ao carregar os dados do arquivo JSON: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void filtrar(String valor) {
    _filtro = valor;
    notifyListeners();
  }
}