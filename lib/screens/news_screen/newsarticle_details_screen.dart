import "package:flutter/material.dart";
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailsScreen({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title.length <= 25
              ? article.title
              : "${article.title.substring(0, 25)}...",
        ),
      ),
      body: const Align(
        child: Text("Article will be displayed using webview"),
      ),
    );
  }
}
