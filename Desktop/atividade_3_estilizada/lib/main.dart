// lib/main.dart

import 'package:flutter/material.dart';
// O import do google_fonts não é mais necessário para o tema
import 'package:provider/provider.dart';
import 'providers/campeonato_provider.dart';
import 'screens/tabela_campeonato_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CampeonatoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CampeonatoProvider>();

    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins', // Usa a fonte local
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Poppins'),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      fontFamily: 'Poppins', // Usa a fonte local
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2E),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    return MaterialApp(
      title: 'Tabela de Futebol',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const TabelaCampeonatoScreen(),
    );
  }
}