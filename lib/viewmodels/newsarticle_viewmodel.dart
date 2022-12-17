import 'package:flutter_mvvm/models/news_article.dart';

// This ViewModel is used for returning Individual article

class NewsArticleViewModel {
  final NewsArticle _article;
  NewsArticleViewModel(NewsArticle article) : _article = article;

  String get title {
    return _article.title;
  }

  String get description {
    return _article.description;
  }

  String get url {
    return _article.url;
  }

  String get urlToImage {
    return _article.urlToImage;
  }
}
