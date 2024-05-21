import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iguana_12/Pages/login_page.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  int _secondsRemaining = 5;

  @override
  void initState() {
    super.initState();
    // Iniciar el temporizador
    _startTimer();
  }

  // Iniciar el temporizador
  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel(); // Cancelar el temporizador cuando el tiempo llega a cero
        _navigateToLoginPage();
      } else {
        setState(() {
          _secondsRemaining--; // Decrementar el tiempo restante en cada segundo
        });
      }
    });
  }

  // Navegar a la página de inicio de sesión
  void _navigateToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(title: 'Página de Acceso'), // Reemplaza 'LoginPage' con el nombre real de tu página de inicio de sesión
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          alignment: Alignment.center, // Centra los widgets dentro del Stack
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.004, 3.146),
                    end: Alignment(-3.146, 0.013),
                    colors: [
                      Color.fromRGBO(231, 15, 15, 0),
                      Color.fromRGBO(196, 182, 107, 1),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/fondo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 20,
              child: Text(
                '¿No tienes una cuenta? \n Regístrate',
                textAlign: TextAlign.center, // Alinea el texto al centro
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.34,
              left: screenWidth * 0.2,
              child: Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/final.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // No hacer nada cuando se presiona el botón flotante
        child: Text('$_secondsRemaining'), // Mostrar el número de segundos restantes en el botón flotante
      ),
    );
  }
}
