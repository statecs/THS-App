import 'package:flutter/material.dart';
import 'package:hawalnir1/src/widgets/sliver_app_bar.dart';
import '../../src/db/database_helper.dart';
import '../../src/db/functions.dart';
import '../../src/widgets/catWidgets.dart';
import '../../wordpress_client.dart';

class ListViewPages extends StatefulWidget {
  final List<Cards> card;

  ListViewPages({Key key, this.card}) : super(key: key);

  @override
  ListViewPagesState createState() {
    return new ListViewPagesState();
  }
}

var scrollCont =
    ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

class ListViewPagesState extends State<ListViewPages> {
  var dbHelper = DatabaseHelper();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('posts count' + widget.card.length.toString());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            displacement: 150.0,
            onRefresh: () => client.listCards(),
            child: CustomScrollView(
              controller: scrollCont,
              slivers: <Widget>[
                SliverAppBarCustomized(),
                sliverListPagesGlobal(widget.card),
              ],
            ),
          ),
//            _buildFab(),
        ],
      ),
    );
  }
}

void scrollToTop() {
  scrollCont.animateTo(0.0,
      duration: Duration(seconds: 1), curve: Curves.elasticInOut);
}
