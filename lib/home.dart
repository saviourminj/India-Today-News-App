import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/category_news.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/blog_tile.dart';
import 'package:news_app/ui/search_query.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  bool search = false;
  TextEditingController query = TextEditingController();

  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  void getNews() async {
    News newsObject = News();
    await newsObject.getNews();
    articles = newsObject.newsArticle;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            setState(() {
              _loading = true;
              articles.clear();
              getNews();
            });
          },
          child: Container(
            child: Opacity(child: Icon(Icons.refresh,color: Colors.blueAccent,),
            opacity: 1,),
          ),
        ),
        title: search
            ? TextField(
                controller: query,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter Keyword to Search',
                  hintStyle: TextStyle(fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  color: Colors.black54)
                ),
                autofocus: true,
                keyboardType: TextInputType.text,
                onSubmitted: (keyword) {
                  setState(() {
                    search = !search;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchQuery(keyWord: query.text)));
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'India',
                    style: TextStyle(fontSize: 27, color: Colors.orange),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Today',
                    style:
                        TextStyle(fontSize: 27, color: Colors.green.shade600),
                  ),
                ],
              ),
        actions: <Widget>[
          IconButton(
              icon: search ? Icon(Icons.clear,color: Colors.green,) : Icon(Icons.search,
              color: Colors.indigo,),
              onPressed: () {
                setState(() {
                  search = !search;
                  query.clear();
                });
              })
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
              child: CircularProgressIndicator(),
            ))
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    ///Categories
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          // use this when listView Under column set shrinkWrap to true
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories.elementAt(index).imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    ///Blogs
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

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 100,
                )),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
