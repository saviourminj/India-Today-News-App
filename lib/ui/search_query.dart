import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/ui/blog_tile.dart';

class SearchQuery extends StatefulWidget {
  final String keyWord;

  SearchQuery({this.keyWord});

  @override
  _SearchQueryState createState() => _SearchQueryState();
}

class _SearchQueryState extends State<SearchQuery> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getSearchQuery();
  }

  void getSearchQuery() async {
    SearchedKeyword searchKeyWord = SearchedKeyword();
    try{
      await searchKeyWord.getSearchResult(widget.keyWord.toLowerCase());
      articles = searchKeyWord.newsArticle;
      setState(() {
        _loading = false;
      });
    }catch(error){
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Opacity(
                opacity: 0,
                child: Icon(Icons.category)),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('India',
              style: TextStyle(fontSize: 27, color: Colors.orange),),
            SizedBox(
              width: 3,
            ),
            Text(
              'Today',
              style: TextStyle(fontSize: 27, color: Colors.green),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: <Widget>[
              ///Blog Tile
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                          webPageURL: articles[index].url,
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          description: articles[index].description);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
