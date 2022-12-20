import 'dart:convert';

import 'package:flutter_mvvm/models/news_article.dart';
import 'package:flutter_mvvm/utils/constants.dart';
import "package:http/http.dart" as http;

class WebService {
  Future<List<NewsArticle>> fetchHeadlineByKeyword(String keyword) async {
    final String url = Constants.headlineFor(keyword);
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List resultList = result["articles"];
      List<NewsArticle> articleList =
          resultList.map((article) => NewsArticle.fromJson(article)).toList();
      return articleList;
    } else {
      throw Exception("Can't fetch the new article");
    }
  }

  //fetching top headlines
  Future<List<NewsArticle>> fetchTopHeadline() async {
    const String url = Constants.topHeadLineUrl;
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List resultList = result["articles"];
      List<NewsArticle> articleList =
          resultList.map((article) => NewsArticle.fromJson(article)).toList();
      return articleList;
    } else {
      throw Exception("Can't fetch the new article");
    }
  }
}
