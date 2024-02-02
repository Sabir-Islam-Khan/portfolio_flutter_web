import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/generalController.dart';
import 'resource/colors.dart';
import 'view/root.dart';

void main() {
  runApp(ProviderScope(child: const AppTheme()));
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabir Islam Khan',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors().primaryColor,
      ),
      home: const RootScreen(),
    );
  }
}
