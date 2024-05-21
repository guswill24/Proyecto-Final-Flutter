import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Song {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String albumArtUrl;
  final String mp3Path;

  Song({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.albumArtUrl,
    required this.mp3Path,
  });
}

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  Future<void> fetchSongsFromDatabase() async {
    Database database = await openDatabase(
      p.join(await getDatabasesPath(), 'base8.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE songs(id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, description TEXT, albumArtUrl TEXT, mp3Path TEXT)',
        );
        // Insertar canciones iniciales
        await db.insert('songs', {
          'title': 'Song 1',
          'subtitle': 'Artist 1',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima1.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 2',
          'subtitle': 'Artist 2',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima2.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 3',
          'subtitle': 'Artist 3',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima3.jpg',
          'mp3Path': 'assets/mp3/tema_3.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 4',
          'subtitle': 'Artist 4',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima4.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 5',
          'subtitle': 'Artist 5',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima5.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 6',
          'subtitle': 'Artist 6',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima6.jpg',
          'mp3Path': 'assets/mp3/tema_3.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 7',
          'subtitle': 'Artist 7',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima7.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
        await db.insert('songs', {
          'title': 'Song 8',
          'subtitle': 'Artist 8',
          'description':
              'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima8.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });
        // Insertar más canciones si es necesario
      },
      version: 1,
    );

    List<Map<String, dynamic>> maps = await database.query('songs');

    _songs = List.generate(maps.length, (index) {
      return Song(
        id: maps[index]['id'],
        title: maps[index]['title'],
        subtitle: maps[index]['subtitle'],
        description: maps[index]['description'],
        albumArtUrl: maps[index]['albumArtUrl'],
        mp3Path: maps[index]['mp3Path'],
      );
    });

    notifyListeners();
  }

  Future<void> deleteSong(int id) async {
    Database database = await openDatabase(
      p.join(await getDatabasesPath(), 'base8.db'),
    );

    await database.delete(
      'songs',
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchSongsFromDatabase();
  }

  Future<void> editSong(Song song) async {
    // Implementar la funcionalidad de edición
    notifyListeners();
  }

  Future<void> regenerateDatabase() async {
    Database database = await openDatabase(
      p.join(await getDatabasesPath(), 'base8.db'),
      onCreate: (db, version) async {
        // Lógica de creación de la tabla y la inserción de datos
      },
      version: 1,
    );

    // Lógica para regenerar la base de datos y actualizar _songs
    await database.transaction((txn) async {
      await txn.execute('DROP TABLE IF EXISTS songs');
      await txn.execute(
        'CREATE TABLE songs(id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, description TEXT, albumArtUrl TEXT, mp3Path TEXT)',
      );
      // Insertar canciones iniciales
        await txn.insert('songs', {
          'title': 'Song 1',
          'subtitle': 'Artist 1',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima1.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
        await txn.insert('songs', {
          'title': 'Song 2',
          'subtitle': 'Artist 2',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima2.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });
        await txn.insert('songs', {
          'title': 'Song 3',
          'subtitle': 'Artist 3',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima3.jpg',
          'mp3Path': 'assets/mp3/tema_3.mp3',
        });		
		await txn.insert('songs', {
          'title': 'Song 4',
          'subtitle': 'Artist 4',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima4.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
		await txn.insert('songs', {
          'title': 'Song 5',
          'subtitle': 'Artist 5',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima5.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });
		await txn.insert('songs', {
          'title': 'Song 6',
          'subtitle': 'Artist 6',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima6.jpg',
          'mp3Path': 'assets/mp3/tema_3.mp3',
        });
		await txn.insert('songs', {
          'title': 'Song 7',
          'subtitle': 'Artist 7',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima7.jpg',
          'mp3Path': 'assets/mp3/tema_1.mp3',
        });
		await txn.insert('songs', {
          'title': 'Song 8',
          'subtitle': 'Artist 8',
          'description': 'La canción se caracteriza por su ritmo pegajoso, su producción retro y su letra optimista, en la que Dua Lipa canta sobre una relación amorosa que la hace sentir como si estuviera flotando',
          'albumArtUrl': 'assets/album/ima8.jpg',
          'mp3Path': 'assets/mp3/tema_2.mp3',
        });

		
      // fin de insertar mas canciones
    });

    List<Map<String, dynamic>> maps = await database.query('songs');

    _songs = List.generate(maps.length, (index) {
      return Song(
        id: maps[index]['id'],
        title: maps[index]['title'],
        subtitle: maps[index]['subtitle'],
        description: maps[index]['description'],
        albumArtUrl: maps[index]['albumArtUrl'],
        mp3Path: maps[index]['mp3Path'],
      );
    });

    // Notificar a los listeners después de actualizar _songs
    notifyListeners();

    // Cerrar la conexión de la base de datos
    await database.close();
  }
}
