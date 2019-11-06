import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // pub to load html tags from json api
import 'hawalnir-date-convertor.dart';
import 'package:hawalnir1/wordpress_client.dart';
import 'catWidgets.dart';

class EachCard extends StatelessWidget {
  EachCard({Key key, @required var this.card}) : super(key: key);
  final Cards card;

  @override
  Widget build(BuildContext context) {
    //debugPrint(post.id.toString());

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: FittedBox(child: cardTitle(card)),
        backgroundColor: Colors.transparent,
      ),
      body: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(tag: 'hero${card.id}', child: cardImage(card)),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: hawalBtnBar(),
                      ),
                    ],
                  ),
                  cardTitle(card),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: cardAuthor(card),
                      ),
                      Expanded(
                        child: cardDate(card),
                      ),
                    ],
                  ),
                  Divider(),
                  contentRendered(card),
                ],
              ),
            ],
          )),
    );
  }

  Widget mainImage(Cards card) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/placeholder.png',
      image: card.featuredMediaUrl == 0
          ? 'src/images/placeholder.png'
          : card.featuredMediaUrl,
    );
  }

  Widget titleRendered(Cards card) {
    return Html(
        data: card.title,
        defaultTextStyle: TextStyle(
            //fontFamily: 'NotoKufiArabic',
            fontSize: 20.0,
            decoration: TextDecoration.none));
  }

  Widget contentRendered(Cards card) {
    return Html(
        data: (card.content).toString(),
        defaultTextStyle: TextStyle(
            fontFamily: 'NotoKufiArabic',
            fontSize: 20.0,
            decoration: TextDecoration.none));
  }

  Widget authorEmbedded(Cards card) {
    return Text(
      "author: " + card.author,
      textAlign: TextAlign.right,
    );
  }

  Widget dateMain(Cards card) {
    return Text(
      dateConvertor(card.date.toString()),
      textAlign: TextAlign.left,
    );
  }
}
