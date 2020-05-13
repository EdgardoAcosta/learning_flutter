import 'package:flutter/material.dart';
import 'package:news/screens/home_sceen.dart';
import 'package:news/viewmodels/new_article_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => NewArticleListViewModel(),
        child: HomeScreen(),
      ),
    );
  }
}
