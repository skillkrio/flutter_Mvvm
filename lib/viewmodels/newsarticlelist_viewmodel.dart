import 'package:flutter_mvvm/models/news_article.dart';
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';
import 'package:flutter_mvvm/webservices/webservice.dart';
import "package:flutter/foundation.dart";

//This viewModel is used for returning the Entire article headline list
class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> newsArticleList = [];

  Future<void> searchArticle(String keyword) async {
    List<NewsArticle> searchedArticle =
        await WebService().fetchHeadlineByKeyword(keyword);
    newsArticleList = searchedArticle
        .map((article) => NewsArticleViewModel(article))
        .toList();
    notifyListeners();
  }

  //populating the List<NewsArticleViewModel>
  Future<void> populateTopHeadlines() async {
    List<NewsArticle> topHeadlines = await WebService().fetchTopHeadline();
    newsArticleList =
        topHeadlines.map((article) => NewsArticleViewModel(article)).toList();
    notifyListeners();
  }
}
