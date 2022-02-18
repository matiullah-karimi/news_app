import 'package:flutter/material.dart';

class BreakingNewsItem extends StatelessWidget {
  const BreakingNewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 64, left: 24, top: 16, bottom: 16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Chip(label: Text('Covid-19')),
          const SizedBox(height: 16),
          Text(
            'The latest on the corona virus pandamic and omicron variant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade100,
            ),
          )
        ],
      ),
    );
  }
}
