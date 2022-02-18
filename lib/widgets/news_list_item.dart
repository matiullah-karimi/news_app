import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Tensions escalate in the US amid coronavirus pandemic'),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text('description'),
      ),
      leading: Container(
        width: 100,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
