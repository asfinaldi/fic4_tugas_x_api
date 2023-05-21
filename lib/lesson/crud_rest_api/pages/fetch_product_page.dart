import 'package:fic_flutter_model_rest_api/lesson/crud_rest_api/network_manager_fic.dart';
import 'package:fic_flutter_model_rest_api/lesson/json_serialization/new_lesson/product_model.dart';
import 'package:flutter/material.dart';

class FetchProductPage extends StatefulWidget {
  const FetchProductPage({super.key});

  @override
  State<FetchProductPage> createState() => _FetchProductPageState();
}

class _FetchProductPageState extends State<FetchProductPage> {
  late Future<ProductModel> productModel;

  @override
  void initState() {
    super.initState();
    productModel = NetworkManagerFic().fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Http - Fetch Product Page'),
      ),
      body: FutureBuilder(
        future: productModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Column(
              children: [
                Text(snapshot.data!.title),
                Image.network(snapshot.data!.images[2]),
                Text(snapshot.data!.description),
              ],
            ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
