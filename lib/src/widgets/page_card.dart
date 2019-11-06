import 'package:flutter/material.dart';
import 'package:hawalnir1/src/models/cards.dart';

import '../pages/listView.dart';
import 'catWidgets.dart';
import 'eachCard.dart';

class PageCard extends StatefulWidget {
  PageCard({Key key, this.card}) : super(key: key);
  final Cards card;

  _PageCardState createState() => _PageCardState();
}

class _PageCardState extends State<PageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: <Widget>[
          /* Stack(
            children: <Widget>[
              Hero(
                  tag: 'hero${widget.post.id}', child: hawalImage(widget.post)),
              Positioned(
                bottom: 2.0,
                left: 5.0,
                child: new ButtonTheme.bar(
                  child: hawalBtnBar(),
                ),
              ),
            ],
          ),*/
          new Padding(
            padding: EdgeInsets.all(5.0),
            child: new ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EachCard(card: widget.card),
                  ),
                );
              },
              title: cardTitle(widget.card),
              subtitle: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  userInterest(widget.card),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  sliverAppBarGlobal() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      expandedHeight: 70.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        title: GestureDetector(
          child: Text('WPFlutter'),
          onTap: scrollToTop,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_circle),
          tooltip: 'Add new entry',
          onPressed: () {},
        ),
      ],
    );
  }
}
