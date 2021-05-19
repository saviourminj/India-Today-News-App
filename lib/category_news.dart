import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/ui/blog_tile.dart';
import 'helper/news.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    CategoryNewsClass newsCategory = CategoryNewsClass();
    await newsCategory.getCategoryForNews(widget.category);
    articles = newsCategory.newsArticle;
    setState(() {
      _loading = false;
    });
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
