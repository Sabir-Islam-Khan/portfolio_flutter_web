import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/generalController.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';
import '../../resource/strings.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, child) {
                var data = ref.watch(hoverProvider);
                bool isHovered = (data == "profilePic");
                return Stack(
                  children: [
                    Container(
                      width: AppClass().getMqWidth(context) *
                          (isHovered ? 0.22 : 0.254),
                      height: AppClass().getMqWidth(context) *
                          (isHovered ? 0.22 : 0.254),
                      margin: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                              color: AppColors().neonColor, width: 1.5)),
                    ),
                    InkWell(
                      onTap: () {},
                      onHover: (bol) {
                        if (bol) {
                          ref.read(hoverProvider.notifier).state = "profilePic";
                        } else {
                          ref.read(hoverProvider.notifier).state = "";
                        }
                      },
                      child: Container(
                        width: AppClass().getMqWidth(context) * 0.25,
                        height: AppClass().getMqWidth(context) * 0.25,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    AppColors().primaryColor,
                                    isHovered
                                        ? BlendMode.lighten
                                        : BlendMode.colorDodge),
                                image: AssetImage('assets/svg/profilePic.png')),
                            color: Colors.transparent),
                      ),
                    ),
                  ],
                );
              }),
              RichText(
                text: TextSpan(
                    text: "  01.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' About Me',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        Strings.aboutPara1,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        Strings.aboutPara2,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        Strings.aboutPara3,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        Strings.techIntro,
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 10,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_right),
                                Text(' Flutter',
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_right),
                                Text(Strings.tech2,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_right),
                                Text(Strings.tech3,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_right),
                                Text(Strings.tech4,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
