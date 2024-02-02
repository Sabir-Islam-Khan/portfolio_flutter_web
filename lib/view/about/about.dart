import 'package:Sabir_Islam_Khan/view/about/abourWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resource/responsive.dart';
import 'aboutMobile.dart';
import 'aboutTab.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: AboutWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}
