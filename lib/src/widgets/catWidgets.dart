import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hawalnir1/src/pages/listView.dart';
import 'package:hawalnir1/src/widgets/posts_card.dart';
import 'package:hawalnir1/src/widgets/page_card.dart';
import 'hawalnir-date-convertor.dart';
import '../config.dart';
import '../../wordpress_client.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

Widget hawalImage(Post post) {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 5.0,
        right: 0,
        left: 0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                blurRadius: 20,
                color: Colors.black,
                offset: new Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
      ),
      Container(
        foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.overlay,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.

                Colors.transparent,
                Colors.transparent,
                Colors.black45,
                Colors.black87,
              ],
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: CachedNetworkImage(
//          width: 200.0,
            fadeInCurve: Curves.decelerate,
            repeat: ImageRepeat.noRepeat,
            fadeInDuration: Duration(milliseconds: 500),
            imageUrl: post.featuredMediaUrl == null
                ? 'assets/images/placeholder.png'
                : post.featuredMediaUrl,
            placeholder: (context, url) =>
                Image.asset('assets/images/placeholder.png'),
            // placeholder: Image.asset('assets/images/placeholder.png'),
            errorWidget: (context, url, error) => Container(
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget hawalTitle(Post post) {
  return Html(
      data: post.title,
      defaultTextStyle: TextStyle(
        fontSize: 20.0,
      ));
}

Widget hawalAuthor(Post post) {
  return Text(
    "author: " + post.author,
    textAlign: TextAlign.right,
  );
}

Widget hawalDate(Post post) {
  return Text(
    dateConvertor(post.date.toString()),
    textAlign: TextAlign.left,
  );
}

Widget hawalBtnBar() {
  return ButtonBar(
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.save),
        splashColor: Colors.blueAccent[200],
        color: Colors.blueGrey,
        tooltip: 'save',
        onPressed: () {
          debugPrint("save button tapped");
        }, // add +1 to the database
      ),
      IconButton(
        icon: Icon(Icons.favorite),
        splashColor: Colors.redAccent,
        color: Colors.blueGrey,
        tooltip: 'like',
        onPressed: () {
          debugPrint("favorite button tapped");
        }, // add +1 to the database
      ),
      IconButton(
        icon: Icon(Icons.share),
        color: Colors.blueGrey,
        tooltip: 'share',
        onPressed: () {
          debugPrint("share button tapped");
        }, // Standard share for whatsapp + google + faccebook + twitter
      ),
    ],
  );
}

Widget connectionErrorBar() {
  return Container(
    alignment: Alignment.bottomCenter,
    child: SnackBar(
      duration: Duration(milliseconds: 200),
      animation: kAlwaysCompleteAnimation,
      content: Text(connectionProblemError),
    ),
  );
}

//Cards

Widget cardImage(Cards cards) {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 5.0,
        right: 0,
        left: 0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                blurRadius: 20,
                color: Colors.black,
                offset: new Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
      ),
      Container(
        foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.overlay,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.

                Colors.transparent,
                Colors.transparent,
                Colors.black45,
                Colors.black87,
              ],
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: CachedNetworkImage(
//          width: 200.0,
            fadeInCurve: Curves.decelerate,
            repeat: ImageRepeat.noRepeat,
            fadeInDuration: Duration(milliseconds: 500),
            imageUrl: cards.featuredMediaUrl == null
                ? 'assets/images/placeholder.png'
                : cards.featuredMediaUrl,
            placeholder: (context, url) =>
                Image.asset('assets/images/placeholder.png'),
            // placeholder: Image.asset('assets/images/placeholder.png'),
            errorWidget: (context, url, error) => Container(
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget cardDate(Cards cards) {
  return Text(
    dateConvertor(cards.date.toString()),
    textAlign: TextAlign.left,
  );
}

Widget cardTitle(Cards cards) {
  return Html(
      data: cards.title,
      defaultTextStyle: TextStyle(
        fontSize: 20.0,
      ));
}

Widget cardAuthor(Cards cards) {
  return Text(
    "author: " + cards.author,
    textAlign: TextAlign.right,
  );
}

Widget userInterest(Cards cards) {
  return Text(
    cards.userInterest,
    textAlign: TextAlign.left,
  );
}

Widget cardRestriction(Cards cards) {
  return Text(
    cards.userInterest,
    textAlign: TextAlign.left,
  );
}

Widget cardMenu(Cards cards) {}

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

sliverListGlobal(List<Post> posts) {
  //debugPrint('SliverListGlobal recived ' + posts.length.toString());
  return SliverList(
//                itemExtent: 600.0,
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, index) {
        return PostsCard(
          post: posts[index],
        );
      },
      childCount: posts.length,
      addAutomaticKeepAlives: true,
    ),
  );
}

sliverListPagesGlobal(List<Cards> cards) {
  //debugPrint('SliverListGlobal recived ' + posts.length.toString());
  return SliverList(
//                itemExtent: 600.0,
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, index) {
        return PageCard(
          card: cards[index],
        );
      },
      childCount: cards.length,
      addAutomaticKeepAlives: true,
    ),
  );
}
