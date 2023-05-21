import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/album.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:flutter/material.dart';

class CreateAlbumPage extends StatefulWidget {
  const CreateAlbumPage({Key? key}) : super(key: key);

  @override
  State<CreateAlbumPage> createState() => _CreateAlbumPageState();
}

class _CreateAlbumPageState extends State<CreateAlbumPage> {
  Future<Album>? futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Album'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  futureAlbum =
                      NetworkManagerFic().createAlbum(_controller.text);
                });
              },
              child: const Text('Create Data'),
            ),
            FutureBuilder(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text(snapshot.data!.title));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
