import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/model/reddit_model.dart';

class RedditRepository {
  final _url = StringConstants.repositoryUrl;

  Future<RedditModel> getRedditData() async {
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return RedditModel.fromMap(json.decode(response.body));
    } else {
      throw Exception(StringConstants.failedData);
    }
  }
}
