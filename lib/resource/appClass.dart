import 'package:Sabir_Islam_Khan/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/models.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "TakeCare",
        projectContent:
            "Leading teli-medicine service provider of Bangladesh. Worked as a senior developer to optimize and scale their already made platform. It was indeed a great experience. TakeCare is now growing rapidly and hopefully soon will be a big name in our country.",
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "GeoCoding"),
    WorkModel(
      projectTitle: "MatchMap",
      projectContent:
          "MatchMap is a sports event planning and hosting platform. You can host events, find sponsors and also buy tickets of your desired events. Its a german based product and I worked as a freelance developer there.",
      tech1: "Flutter",
      tech2: "Stripe",
      tech3: "GraphQL",
    ),
    WorkModel(
        projectTitle: "Zyco",
        projectContent:
            '''Zyco is business to business Taxi service provider based on Netherlands. I worked as a Flutter Developer to create their app. Communicating with backend developers and UI/UX designers were by go to task. I mainly worked with front end and API integration.''',
        tech1: "REST",
        tech2: "Microservices",
        tech3: "Flutter"),
    WorkModel(
      projectTitle: "Bus Location Tracker",
      projectContent:
          '''One of my hobby project. I created this with one of my friend. We coded a MQTT signalling device that sends location data to our real time server. We made a flutter app too where users can search vehicle and see its real time location in a snap.''',
      tech1: "Android",
      tech2: "MQTT",
      tech3: "RealTime DB",
    ),
    WorkModel(
      projectTitle: "Duah",
      projectContent:
          '''This native android app using built using Java for a client. This is a digital Quran. You can search any verse easily, see translation in any language and also use its TTS functionality to listen to any verse. Its available on playstore only.''',
      tech1: "Java",
      tech2: "Firebase",
      tech3: "Text to Speech",
    ),
    WorkModel(
      projectTitle: "Friend In Need",
      projectContent:
          '''Another native android app made with Java. I made this for national science congress 2018 and became champion. This app can save your emergency contact and when in danger, by pressing dedicated buttons, it will send users realtime location without any internet to the emergency contacts and also to the nearest Police Station.''',
      tech1: "Java",
      tech2: "Android",
      tech3: "Geo-Location",
    ),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url,
            body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
