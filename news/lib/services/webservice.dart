import 'package:news/utils/constants.dart';

import 'networking.dart';
import 'package:news/models/news_actricle.dart';

class Webservice {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    var networkHelper = NetworkHelper(kHeadlinesURL);

    try {
      var content = await networkHelper.getData();
      Iterable list = content['articles'];

      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } catch (e) {
      print('Error');
      return List();
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keywords) async {
    var networkHelper = NetworkHelper(kHeadlinesSearchURL + keywords);

    try {
      var content = await networkHelper.getData();
      Iterable list = content['articles'];

      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } catch (e) {
      print('Error');
    }
    return List();
  }
}
