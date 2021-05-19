import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/article_view.dart';
import 'package:news_app/constants/const.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, webPageURL;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.webPageURL,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              webURL: webPageURL,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                height: MediaQuery.of(context).size.height / 3.7,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
                imageErrorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  print('Error Handler');
                  return CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: errorImageUrl,
                  );
                },
                placeholder: NetworkImage(placeHolder),
                image: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
