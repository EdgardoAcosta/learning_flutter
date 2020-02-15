import 'package:flutter/material.dart';
import 'package:news/models/news_actricle.dart';
import 'package:news/services/webservice.dart';
import 'package:news/viewmodels/new_article_viewmodel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewArticleListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;

  List<NewArticleViewModel> articles = List<NewArticleViewModel>();

  void populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> search(String keywords) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles =
        await Webservice().fetchHeadlineByKyWord(keywords);

    this.articles = newsArticles
        .map((article) => NewArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
