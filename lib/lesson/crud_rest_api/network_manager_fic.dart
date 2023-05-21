import 'dart:convert';

import 'package:fic_flutter_model_rest_api/lesson/json_serialization/new_lesson/product_model.dart';

import 'album.dart';
import 'package:http/http.dart' as http;

class NetworkManagerFic {
  Future<Category> fetchCategory() async {
    final response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/categories/1'));
    if (response.statusCode == 200) {
      return Category.fromJson(response.body);
    } else {
      throw Exception('Failef to load category');
    }
  }

  Future<ProductModel> fetchProduct() async {
    final response = await http
        .get(Uri.parse('https://api.escuelajs.co/api/v1/products/83'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> fetchAllAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Album> listData = List<Album>.from(
          json.decode(response.body).map((x) => Album.fromJson(x)));
      return listData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<Album> updateAlbum(int id, String title) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future<Album> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Jika server mengembalikan respons 200 OK,
      // lalu parsing JSON. Setelah menghapus,
      // Anda akan mendapatkan respons `{}` JSON kosong.
      // Jangan kembalikan `null`, jika mengembalikan null `snapshot.hasData`
      // akan selalu menghasilkan false pada `FutureBuilder`.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
