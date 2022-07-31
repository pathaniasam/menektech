import 'package:flutter/material.dart';
import 'package:manek/app.dart';
import 'package:manek/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(locateService<App>());
}
