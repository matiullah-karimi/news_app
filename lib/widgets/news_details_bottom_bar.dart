import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/providers/app_tab.dart';
import 'package:flutter/material.dart';

class NewsDetailsBottomBar extends ConsumerWidget {
  const NewsDetailsBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_outlined),
          label: 'Like',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share_outlined),
          label: 'Share',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment_bank_outlined),
          label: 'Comment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save_outlined),
          label: 'Save',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.grey.shade700,
      unselectedItemColor: Colors.grey.shade700,
      onTap: (index) {},
    );
  }
}
