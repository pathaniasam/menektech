import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manek/screens/home/home_screen_v.dart';

@injectable
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}
