import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  final baseUrlApi = "https://api.nytimes.com/svc/search/v2/";
  final apIKey = "AvH0T5ZsdpDdz3nNs3adYPIjQGJJKJDt";

  Future<List> getArticlesOnTheBasesOfFilter(value, page) async {
    final response = await http.get(
      Uri.parse(
          '${baseUrlApi}articlesearch.json?fq=$value&page=$page&api-key=$apIKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(Uri.parse(
        '${baseUrlApi}articlesearch.json?fq=$value&page=$page&api-key=$apIKey'));
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return [true, jsonDecode(response.body.toString())];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return [false, jsonDecode(response.body.toString())];
    }
  }

  Future<List> getBooksOnTheBasesOfFilter(value, page, date) async {
    final response = await http.get(
      Uri.parse(
          '${baseUrlApi}articlesearch.json?fq=$value&page=$page&pub_date=$date&api-key=$apIKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(Uri.parse(
        '${baseUrlApi}articlesearch.json?fq=$value&page=$page&pub_date=$date&api-key=$apIKey'));
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return [true, jsonDecode(response.body.toString())];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return [false, jsonDecode(response.body.toString())];
    }
  }
}
