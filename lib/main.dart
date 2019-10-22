import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/screens/dumbest.dart';
import 'package:trump_machine/screens/home_screen.dart';
import 'package:trump_machine/screens/search_results.dart';
import 'package:trump_machine/screens/topics.dart';
import 'package:trump_machine/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return ChangeNotifierProvider<Services>(
      builder: (context) => Services(),
      child: Consumer<Services>(
        builder: (context, services, _) {
          return MaterialApp(
            routes: {
              '/topics': (context) => TopicScreen(),
              '/dumbest': (context) => DumbestEverScreen(),
              '/results': (context) => SearchResultScreen(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Trump Machine',
            theme: ThemeData(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.brown,
              ),
              primarySwatch: Colors.orange,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class TopicsScreen {}
