import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quad/models/show_model.dart';

class ApiService {
  final String apiUrl = "https://api.tvmaze.com/search/shows?q=all";

  Future<List<ShowModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ShowModel.fromJson(item['show'])).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}













