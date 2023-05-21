import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/album.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:flutter/material.dart';

class UpdateAlbumPage extends StatefulWidget {
  const UpdateAlbumPage({super.key});

  @override
  State<UpdateAlbumPage> createState() => _UpdateAlbumPageState();
}

class _UpdateAlbumPageState extends State<UpdateAlbumPage> {
  late Future<Album>? futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                futureAlbum =
                    NetworkManagerFic().updateAlbum(1, _controller.text);
              });
            },
            child: const Text('Update Data'),
          ),
        ],
      ),
    );
  }
}
