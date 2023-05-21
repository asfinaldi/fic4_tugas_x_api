import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:flutter/material.dart';
import 'package:fic_flutter_model_rest_api/lesson/json_serialization/new_lesson/product_model.dart';

class FetchCategoryPage extends StatefulWidget {
  const FetchCategoryPage({super.key});

  @override
  State<FetchCategoryPage> createState() => _FetchCategoryPageState();
}

class _FetchCategoryPageState extends State<FetchCategoryPage> {
  late Future<Category> category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = NetworkManagerFic().fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Http - Fetch Category'),
      ),
      body: FutureBuilder(
        future: category,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.name),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('$snapshot.error');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
