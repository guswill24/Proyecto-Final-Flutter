import 'package:flutter/material.dart';

class CreditosPage extends StatefulWidget {
  const CreditosPage({super.key, required this.title});
  final String title;

  @override
  _CreditosPageState createState() => _CreditosPageState();
}

class _CreditosPageState extends State<CreditosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  200, // Ajustar la altura según sea necesario
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 243, 243, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -132,
                    left: (MediaQuery.of(context).size.width - 477) / 2,
                    child: SizedBox(
                      width: 477,
                      height: 477,
                      child: ClipOval(
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.004, 3.146),
                                    end: Alignment(-3.146, 0.013),
                                    colors: [
                                      Color.fromRGBO(229, 214, 214, 0),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/fondo.jpg'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -132,
                    left: (MediaQuery.of(context).size.width - 477) / 2,
                    child: SizedBox(
                      width: 477,
                      height: 477,
                      child: ClipOval(
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 132,
                              left: 48,
                              child: Container(
                                width: 375,
                                height: 335,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.004, 3.146),
                                    end: Alignment(-3.146, 0.013),
                                    colors: [
                                      Color.fromRGBO(229, 214, 214, 0),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/fondo.jpg'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 187,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 79,
                    left: (MediaQuery.of(context).size.width - 216) / 2,
                    child: Container(
                      width: 216,
                      height: 216,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(216, 216)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 89,
                    left: (MediaQuery.of(context).size.width - 196) / 2,
                    child: Container(
                      width: 196,
                      height: 196,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/gustavo.png'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(196, 196)),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 303,
                    left: 37,
                    right: 37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Créditos',
                          style: TextStyle(
                            color: Color.fromARGB(255, 22, 21, 21),
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Gustavo Sánchez Rodríguez\nIngeniero de sistemas\n\n\nAgradecer a Codigo Facilito por el excelente equipo de profesores que nos acompañaron en todo el desarrollo del Bootcamp y al personal de soporte que estuvieron atentos a que el evento se desarrollara de la mejor forma.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/route4');
        },
        backgroundColor: const Color.fromARGB(255, 68, 138, 255),
        shape: const CircleBorder(),
        child: const Icon(Icons.queue_music, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamed(context, '/route3');
                  },
                  color: Colors.white,
                ),
              ),
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.pushNamed(context, '/route1');
                  },
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
