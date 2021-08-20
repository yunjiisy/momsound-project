import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/widgets/BubblePainter2.dart';
import 'package:momsori/widgets/topics.dart';

import 'menu_screen.dart';
//F4F3FBFF

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // DateTime date = DateTime.parse(user.babyBirth);

  // _babyDay() {
  //   var k = DateTime(
  //     date.year,
  //     date.month,
  //     date.day,
  //   )
  //       .difference(DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //       ))
  //       .inDays;
  //   return k;
  // }
  //
  // _babyWeek() {
  //   return (40 - _babyDay() ~/ 7);
  // }
  //
  // _babyMonth() {
  //   return (_babyWeek() ~/ 4 + 1);
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.03 * height,
          ),
          Container(
            height: 0.05 * height,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '14주차',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(MenuScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/세팅선택x.svg',
                      width: 36,
                      height: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.04 * height,
          ),
          Container(
            height: 0.05 * height,
            child: Center(
              child: Text(
                // '${user.babyNickname}',
                '동동이',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // '${user.babyBirth} 예정',
                '2021.12.31 예정',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 0.025 * width,
              ),
              Text(
                '|',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 0.025 * width,
              ),
              Text(
                'D-190',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 0.47 * height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: height * 0.13,
                          width: width * 0.8,
                          child: CustomPaint(
                            painter: BubblePainter2(),
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 21,
                              ),
                              child: Center(
                                child: Text(
                                  topic[0],
                                  style: TextStyle(
                                    // color: Colors.white,
                                    // color: Color(0xFFFFA9A9),
                                    color: Color(0xFF7C7C7C),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Image.asset(
                        "assets/images/gif_check.gif",
                        height: 0.32 * height,
                        width: 0.7 * width,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 0.1 * height,
            child: InkWell(
              onTap: () {
                Get.to(
                  RecoderScreen(),
                  transition: Transition.downToUp,
                );
              },
              child: SvgPicture.asset(
                'assets/icons/record_ic.svg',
                width: 0.2 * height,
                height: 0.2 * width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
