import 'package:flutter/material.dart';
import 'package:iguana_12/Provider/song_provider.dart';
import 'package:provider/provider.dart';
import 'play_list_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key, required this.title});
  final String title;

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<SongProvider>(context, listen: false).fetchSongsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SongProvider>(
        builder: (context, songProvider, child) {
          // Fetch songs from the database if not already fetched
          if (songProvider.songs.isEmpty) {
            songProvider.fetchSongsFromDatabase();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/final.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Seleccione la canción a escuchar',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w100,
                                height: 1,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40, // Define el ancho del botón
                              height: 40, // Define la altura del botón
                              decoration: const BoxDecoration(
                                shape: BoxShape
                                    .circle, // Establece la forma del contenedor como círculo
                                color: Colors
                                    .blue, // Establece el color de fondo del contenedor
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  try {
                                    await songProvider.regenerateDatabase();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Base de datos regenerada con éxito'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Error al regenerar la base de datos: $e'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons
                                    .storage), // Agrega el icono de la base de datos
                                color: Colors
                                    .white, // Establece el color del icono
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 250,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: songProvider.songs.length,
                          itemBuilder: (context, index) {
                            final song = songProvider.songs[index];
                            final backgroundColor = index % 2 == 0
                                ? Colors.white
                                : const Color.fromARGB(255, 244, 241, 241);
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(song.albumArtUrl),
                              ),
                              title: Text(song.title),
                              subtitle: Text(song.subtitle),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_circle),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayListPage(
                                            song: song,
                                            title: '',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  /*
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      songProvider.editSong(song);
                                    },
                                  ),*/
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      songProvider.deleteSong(song.id);
                                    },
                                  ),
                                ],
                              ),
                              tileColor: backgroundColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/route6');
        },
        backgroundColor: const Color.fromARGB(255, 68, 138, 255),
        shape: const CircleBorder(),
        child: const Icon(Icons.person, color: Colors.white),
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

  void showDialogWithSong(BuildContext context, Song song) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información de la Canción'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Título: ${song.title}'),
              Text('Subtítulo: ${song.subtitle}'),
              Text('Mp3: ${song.mp3Path}'),
              Text('Album: ${song.albumArtUrl}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
