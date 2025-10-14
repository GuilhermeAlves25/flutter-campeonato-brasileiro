// lib/main.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // 'watch' faz com que o MyApp se reconstrua quando o tema mudar
    final provider = context.watch<CampeonatoProvider>();

    // Definimos os dois temas que nosso app pode ter
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    );

    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2E),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    );

    return MaterialApp(
      title: 'Tabela de Futebol',
      debugShowCheckedModeBanner: false,

      theme: lightTheme,      // Tema a ser usado no modo claro
      darkTheme: darkTheme,   // Tema a ser usado no modo escuro

      // Aqui está a mágica: o provider decide qual tema será exibido
      themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const TabelaCampeonatoScreen(),
    );
  }
}