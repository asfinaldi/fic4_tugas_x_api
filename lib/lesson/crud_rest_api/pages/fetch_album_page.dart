import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/album.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:flutter/material.dart';

class FetchAlbumPage extends StatefulWidget {
  const FetchAlbumPage({super.key});

  @override
  State<FetchAlbumPage> createState() => _FetchAlbumPageState();
}

class _FetchAlbumPageState extends State<FetchAlbumPage> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    futureAlbum = NetworkManagerFic().fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Http Fetch Album'),
      ),
      body: FutureBuilder(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data!.title),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
