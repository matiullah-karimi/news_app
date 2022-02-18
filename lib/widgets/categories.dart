import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  GlobalKey key = GlobalKey(); // declare a global key

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
              ),
              child: TabBar(
                labelColor: Colors.blue.shade800,
                unselectedLabelColor: Colors.grey.shade600,
                indicatorColor: Colors.blue.shade800,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                indicatorWeight: 2,
                tabs: [
                  Tab(text: "Trending"),
                  Tab(text: "Health"),
                  Tab(text: "Politics"),
                  Tab(text: "Sports"),
                  Tab(text: "Trending"),
                  Tab(text: "Health"),
                  Tab(text: "Politics"),
                  Tab(text: "Sports"),
                  Tab(text: "Trending"),
                  Tab(text: "Health"),
                  Tab(text: "Politics"),
                  Tab(text: "Sports"),
                ],
              ),
            ),
          ),
          Container(
            key: key,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 3 -
                kTextTabBarHeight -
                kToolbarHeight -
                36,
            child: TabBarView(
              children: [
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
