import 'package:flutter/material.dart';
import 'package:iguana_12/Provider/song_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key, required this.title, required this.song});
  final String title;
  final Song song;

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage>
    with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopAudio(); // Detener el audio al salir de la pantalla
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _stopAudio(); // Detener el audio cuando la aplicación entra en segundo plano
    }
  }

  Future<void> _init() async {
    var logger = Logger();
    try {
      // Verificar si la ruta del archivo MP3 es válida
      bool exists = await checkAssetExists(widget.song.mp3Path);
      if (exists) {
        // Limpiar el reproductor antes de cargar un nuevo archivo
        await _audioPlayer.stop();
        await _audioPlayer.seek(Duration.zero);

        // La ruta es válida, establecer el archivo MP3 en el reproductor de audio
        await _audioPlayer.setAsset(widget.song.mp3Path);
        // Configurar el control de volumen
        _audioPlayer.setVolume(_volume);
      } else {
        // La ruta no es válida
        logger.e(
            'La ruta del archivo MP3 no es válida. File: ${widget.song.mp3Path}');
      }
    } catch (e) {
      logger.e('Error message: $e');
    }
  }

  Future<bool> checkAssetExists(String assetPath) async {
    try {
      ByteData data = await rootBundle.load(assetPath);
      return data.lengthInBytes != 0;
    } catch (e) {
      return false; // Manejar cualquier excepción y considerar que el archivo no existe
    }
  }

  void _playAudio() async {
    try {
      await _audioPlayer.play();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al reproducir el audio: $e');
    }
  }

  void _pauseAudio() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al pausar el audio: $e');
    }
  }

  void _stopAudio() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      var logger = Logger();
      logger.e('Error al detener el audio: $e');
    }
  }

  void _setVolume(double volume) {
    _audioPlayer.setVolume(volume);
  }

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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.song.albumArtUrl),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(196, 196)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 303,
                    left: 37,
                    right: 37,
                    child: Text(
                      widget.song.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  // Agregar controles de audio
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: _playAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.pause),
                                onPressed: _pauseAudio,
                              ),
                              IconButton(
                                icon: const Icon(Icons.stop),
                                onPressed: _stopAudio,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.volume_up),
                              Expanded(
                                child: Slider(
                                  value: _volume,
                                  onChanged: (value) {
                                    setState(() {
                                      _volume = value;
                                      _setVolume(_volume);
                                    });
                                  },
                                  min: 0.0,
                                  max: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
