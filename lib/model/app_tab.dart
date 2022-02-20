import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screens/live_streaming.dart';

enum AppTabs { home, tv, settings }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const MyHomePage();
      case AppTabs.tv:
        return const VideoLiveStreaming();
      case AppTabs.settings:
        return const MyHomePage();
      default:
        return const MyHomePage();
    }
  }
}
