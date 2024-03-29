import 'package:flutter/material.dart';

import '../../resource/responsive.dart';
import 'experienceMob.dart';
import 'experienceTab.dart';
import 'experienceWeb.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: ExperienceWeb(),
      mobileView: ExperienceMob(),
      tabView: ExperienceTab(),
    );
  }
}
