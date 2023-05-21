import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "id": 1,
//     "name": "Rings",
//     "image": "https://picsum.photos/640/640?r=836",
//     "creationAt": "2023-05-21T07:33:53.000Z",
//     "updatedAt": "2023-05-21T17:11:53.000Z"
// }

class Category {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updateAt;
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt,
      'updateAt': updateAt,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'].toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      creationAt: map['creationAt'] ?? '',
      updateAt: map['updateAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
