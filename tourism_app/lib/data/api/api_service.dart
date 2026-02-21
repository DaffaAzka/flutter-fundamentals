import 'dart:convert';

import 'package:navigation_app/data/model/tourism_detail_response.dart';
import 'package:navigation_app/data/model/tourism_list_response.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return TourismListResponse.fromMap(jsonDecode(response.body));
    } else {
      throw Exception("Error while fetching data");
    }
  }

  Future<TourismDetailResponse> getTourismDetail(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
    if (response.statusCode == 200) {
      return TourismDetailResponse.fromMap(jsonDecode(response.body));
    } else {
      throw Exception("Error while fetching data");
    }
  }
}
