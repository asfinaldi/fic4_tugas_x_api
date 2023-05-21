import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/create_album_page.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/delete_album_page.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/fetch_album_page.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/fetch_category_page.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/fetch_product_page.dart';
import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/pages/update_album_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FetchCategoryPage(),
      ),
    );
  }
}
