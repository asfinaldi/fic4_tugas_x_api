import 'dart:convert';

import 'user.dart';

void main(List<String> args) {
  const String jsonString = """
{
  "name":"Udin",
  "email":"udin@gmail.com"
}
""";
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);

  print('Haloo,${user.name}');
  print('Email verifikasi link : ${user.email}');

  String json = jsonEncode(user);

  print('String json: $json');
  
}
