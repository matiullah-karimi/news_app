import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/app_tab.dart';
import 'package:news_app/providers/app_tab.dart';
import 'package:news_app/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs tab = ref.watch(appTabProvider);

    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: const BottomNavigationBarWidget(),
        body: IndexedStack(
          index: tab.index,
          children: AppTabs.values.map((t) => t.screen).toList(),
        ),
      ),
    );
  }
}
