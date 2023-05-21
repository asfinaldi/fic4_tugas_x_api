import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/album.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:flutter/material.dart';

class DeleteAlbumPage extends StatefulWidget {
  DeleteAlbumPage({super.key});

  @override
  State<DeleteAlbumPage> createState() => _DeleteAlbumPageState();
}

class _DeleteAlbumPageState extends State<DeleteAlbumPage> {
  late Future<Album>? futureAlbum;
  @override
  void initState() {
    futureAlbum = NetworkManagerFic().deleteAlbum('2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Album'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) if (snapshot
                .hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.title.isEmpty
                        ? 'Deleted'
                        : snapshot.data!.title,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureAlbum = NetworkManagerFic()
                            .deleteAlbum(snapshot.data!.id.toString());
                      });
                    },
                    child: const Text('Deleta Data'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
