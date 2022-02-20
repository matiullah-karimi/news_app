import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/live_streaming.dart';

enum AppTabs { home, tv, settings }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const Home();
      case AppTabs.tv:
        return const VideoLiveStreaming();
      case AppTabs.settings:
        return const Home();
      default:
        return const Home();
    }
  }
}
