import 'package:flutter/material.dart';
import 'package:news/viewmodels/new_article_viewmodel.dart';

class NewsList extends StatelessWidget {
  final List<NewArticleViewModel> articles;
  const NewsList({@required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
              leading: Container(
                child: article.imageURL == null
                    ? Image.asset('images/placehorder-image.jpg')
                    : Image.network(article.imageURL),
                width: 100,
                height: 100,
              ),
              title: Text(articles[index].title));
        },
      ),
    );
  }
}
