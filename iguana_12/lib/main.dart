import 'package:flutter/material.dart';
import 'package:iguana_12/Pages/creditos_pages.dart';
import 'package:iguana_12/Pages/home_page.dart';
import 'package:iguana_12/Pages/login_page.dart';
import 'package:iguana_12/Pages/my_first_page.dart';
import 'package:iguana_12/Pages/play_list_page.dart';
import 'package:iguana_12/Provider/song_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/music_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SongProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFirstPage(title: 'Morgan Music App'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) =>
            const MyFirstPage(title: 'Página Inicio'),
        '/route2': (BuildContext context) =>
            const LoginPage(title: 'Página de Acceso'),
        '/route3': (BuildContext context) =>
            const HomePage(title: 'Página Home'),
        '/route4': (BuildContext context) =>
            const MusicPage(title: 'Página Listar Musica'),
        '/route5': (BuildContext context) => PlayListPage(
              title: 'Ejecutar Musica',
              song: ModalRoute.of(context)!.settings.arguments as Song,
            ),
        '/route6': (BuildContext context) =>
            const CreditosPage(title: 'Página de Créditos'),
      },
    );
  }
}
