import 'dart:convert';

import 'package:json_parsing/user.dart';

class TryJson {
  static String dynamicJsonParsed() {
    final String jsonData = """
  {
    "id": 167,
    "name": "Rifa Fauzi",
    "address": "Jakarta"
  }
  """;

    final Map<String, dynamic> parse = jsonDecode(jsonData);
    User user = User.fromMap(parse);

    return user.name;
  }
}
