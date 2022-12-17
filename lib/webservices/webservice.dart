import 'dart:convert';

import 'package:flutter_mvvm/models/news_article.dart';
import "package:http/http.dart" as http;

class WebService {
  //fetching articles by keyword

  Future<List<NewsArticle>> fetchHeadlineByKeyword(String keyword) async {
    const String url = "";
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List resultList = result["articles"];
      List<NewsArticle> articleList =
          resultList.map((json) => NewsArticle.fromJson(json)).toList();
      return articleList;
    } else {
      throw Exception("Failed to fetch");
    }
  }

  //fetching top headlines
  Future<List<NewsArticle>> fetchTopHeadline() async {
    const String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=86acb07a43db4b51a693551e0cce0d18";
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
