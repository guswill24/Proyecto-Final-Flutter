import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Container(
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
              top: 250,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 417,
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
              top: 90,
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
              top: 100,
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
            Positioned(
              top: 303,
              left: 37,
              right: 37,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildEmailTextField(),
                    const SizedBox(height: 20.0),
                    _buildPasswordTextField(),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/route3');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 8,
                      ),
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito', // Aplicar la fuente Nunito
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red[100],
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        child: Center(
          child: Container(
            height: 50,
            child: const Text(
              '¿Olvido su Contraseña?',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito', // Aplicar la fuente Nunito
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildEmailTextField() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'Correo electrónico',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      suffixIcon: const Icon(Icons.email),
    ),
  );
}

Widget _buildPasswordTextField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Contraseña',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      suffixIcon: const Icon(Icons.lock),
    ),
  );
}
