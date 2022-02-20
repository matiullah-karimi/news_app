import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/providers/app_tab.dart';
import 'package:news_app/model/app_tab.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs currentTab = ref.watch(appTabProvider);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv_sharp),
          label: 'Live TV',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
      currentIndex: currentTab.index,
      selectedItemColor: Colors.blue.shade800,
      unselectedItemColor: Colors.grey.shade500,
      onTap: (index) {
        ref.read(appTabProvider.notifier).changeTab(index);
        final tab = ref.read(appTabProvider);

        if (tab == currentTab) {
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => tab.screen,
          ),
        );
      },
    );
  }
}
