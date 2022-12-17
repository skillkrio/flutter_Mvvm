import 'package:flutter_mvvm/models/news_article.dart';
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';
import 'package:flutter_mvvm/webservices/webservice.dart';
import "package:flutter/foundation.dart";

//This viewModel is used for returning the Entire article headline list
class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> newsArticleList = [];

  //populating the List<NewsArticleViewModel>
  Future<void> populateTopHeadlines() async {
    List<NewsArticle> topHeadlines = await WebService().fetchTopHeadline();
    newsArticleList =
        topHeadlines.map((article) => NewsArticleViewModel(article)).toList();
    notifyListeners();
  }
}
