import 'dart:convert';

void main(List<String> args) {
  const String jsonString = """
{
  "name" : "Asfinaldi",
  "email": "asfinaldi@gmail.com"
}
""";
  Map<String, dynamic> user = jsonDecode(jsonString);

  print('Halo, ${user['name']}!');
  print('Email verifikasi : ${user['email']}!');
}
