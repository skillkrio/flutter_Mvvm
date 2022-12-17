import "package:flutter/material.dart";
import 'package:flutter_mvvm/viewmodels/newsarticlelist_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
//  We set the listen parameter to false, since we are only invoking the method and we do not need to listen to anything
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top News"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: viewModel.newsArticleList.length,
        itemBuilder: (context, index) {
          final article = viewModel.newsArticleList[index];
          return ListTile(
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
      ),
    );
  }
}
