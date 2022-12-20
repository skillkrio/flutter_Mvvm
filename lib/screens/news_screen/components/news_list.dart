import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/news_screen/newsarticle_details_screen.dart';
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsList({super.key, required this.articles});

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsArticleDetailsScreen(article: article),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            _showNewsArticleDetails(context, article);
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
