import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/news_screen/newsarticle_details_screen.dart';
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final void Function(NewsArticleViewModel article) onselected;
  const NewsList({
    super.key,
    required this.articles,
    required this.onselected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            onselected(article);
          },
          leading: SizedBox(
            height: 100,
            width: 100,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(article.urlToImage.isEmpty
                  ? "https://source.unsplash.com/random/300x200"
                  : article.urlToImage),
            ),
          ),
          title: Text(article.title),
        );
      },
    );
  }
}
