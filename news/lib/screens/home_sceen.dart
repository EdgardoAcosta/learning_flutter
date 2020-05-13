import 'package:flutter/material.dart';
import 'package:news/components/news_list.dart';
import 'package:news/viewmodels/new_article_list_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  Widget _buildList(NewArticleListViewModel vm) {
  switch(vm.loadingStatus) {
      case LoadingStatus.searching: 
        return Align(child: CircularProgressIndicator()); 
      case LoadingStatus.empty: 
        return Align(child: Text("No results found!"));
      case LoadingStatus.completed: 
        return Expanded(child: NewsList(
          articles: vm.articles, 
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewArticleListViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
          actions: <Widget>[],
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.isNotEmpty) vm.search(value);
              },
              decoration: InputDecoration(
                  labelText: 'Enter search term',
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
            _buildList(vm)
          ],
        ),
      ),
    );
  }
}
