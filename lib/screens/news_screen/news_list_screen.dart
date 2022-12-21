import "package:flutter/material.dart";
import 'package:flutter_mvvm/screens/news_screen/components/news_list.dart';
import 'package:flutter_mvvm/screens/news_screen/newsarticle_details_screen.dart';
import 'package:flutter_mvvm/viewmodels/newsarticle_viewmodel.dart';
import 'package:flutter_mvvm/viewmodels/newsarticlelist_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final textEditingController = TextEditingController();

  void _showNewsArticleDetails(NewsArticleViewModel article) {
    print(context.hashCode);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsArticleDetailsScreen(article: article),
    ));
  }

  Widget _buildList(NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingStatus) {
      case LoadingStatus.loading:
        return const Align(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return const Align(
          child: Text("No Data Found"),
        );
      case LoadingStatus.commpleted:
        return Expanded(
          child: NewsList(
            articles: viewModel.newsArticleList,
            onselected: _showNewsArticleDetails,
          ),
        );
    }
  }

  @override
  void initState() {
//  We set the listen parameter to false, since we are only invoking the method and we do not need to listen to anything
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Top News"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your keyword",
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
              onSubmitted: (inputs) {
                //fetch all articles related to keyword
                if (inputs.isNotEmpty) {
                  viewModel.searchArticle(inputs);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _buildList(viewModel),
          ],
        ));
  }
}
