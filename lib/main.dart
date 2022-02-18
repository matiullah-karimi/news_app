import 'package:flutter/material.dart';
import 'package:news_app/widgets/breaking_news.dart';
import 'package:news_app/widgets/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Breaking News',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const BreakingNews(),
              ),
              const SizedBox(height: 24),
              const Categories()
            ],
          ),
        ),
      ),
    );
  }
}
