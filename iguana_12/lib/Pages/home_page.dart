import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                              image: AssetImage('assets/images/fondo.jpg'),
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
              child: Container(
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
                              image: AssetImage('assets/images/fondo.jpg'),
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
                height: 520,
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
                  borderRadius: BorderRadius.all(Radius.elliptical(216, 216)),
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
                  color: Color.fromRGBO(26, 171, 207, 0.024),
                  image: DecorationImage(
                    image: AssetImage('assets/images/final.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(196, 196)),
                ),
              ),
            ),
            const Positioned(
              top: 303,
              left: 37,
              right: 37,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenido a Music App',
                      style: TextStyle(
                        color: Color.fromARGB(255, 22, 21, 21),
                        fontFamily: 'Nunito', // Aplicar la fuente Nunito
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Estamos encantados de tenerte con nosotros en esta nueva experiencia musical. En Morgan Musica App, encontrarás tus canciones favoritas, descubrirás nuevos artistas y crearás listas de reproducción personalizadas para cada momento de tu vida. \n Deja que la música te acompañe dondequiera que vayas y comparte tus melodías preferidas con amigos.¡Explora, disfruta y deja que la música te inspire! \n\n¡Vamos a comenzar!',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromARGB(255, 22, 21, 21),
                        fontFamily: 'Nunito', // Aplicar la fuente Nunito
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red[100],
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
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushNamed(context, '/route6');
                  },
                  color: Colors.white,
                ),
              ),
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.blueAccent,
                ),
                child: Tooltip(
                  message: 'Salir',
                  child: IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () {
                      Navigator.pushNamed(context, '/route1');
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
