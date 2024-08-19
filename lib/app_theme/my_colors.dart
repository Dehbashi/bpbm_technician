import 'package:flutter/material.dart';

class MyColors {
  final int id;
  final Color shade25;
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;

  const MyColors({
    required this.id,
    required this.shade25,
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
  });

  //NEUTRAL COLORS
  MyColors.neutral()
      : id = 1,
        shade25 = const Color(0xffFCFCFD),
        shade50 = const Color(0xffF9FAFB),
        shade100 = const Color(0xffF2F4F7),
        shade200 = const Color(0xffEAECF0),
        shade300 = const Color(0xffD0D5DD),
        shade400 = const Color(0xff98A2B3),
        shade500 = const Color(0xff667085),
        shade600 = const Color(0xff475467),
        shade700 = const Color(0xff344054),
        shade800 = const Color(0xff1D2939),
        shade900 = const Color(0xff101828);

  //PRIMARY COLORS
  MyColors.primaryLight()
      : id = 2,
        shade25 = const Color(0xffFAFFFF),
        shade50 = const Color(0xffF5FEFF),
        shade100 = const Color(0xffEBFDFF),
        shade200 = const Color(0xffD8FAFD),
        shade300 = const Color(0xffC8F5F9),
        shade400 = const Color(0xffB3EDF2),
        shade500 = const Color(0xff82E4EC),
        shade600 = const Color(0xff55CFDA),
        shade700 = const Color(0xff41BBC6),
        shade800 = const Color(0xff009EAB),
        shade900 = const Color(0xff30777D);
  MyColors.primaryDark()
      : id = 3,
        shade25 = const Color(0xffFAFFFF),
        shade50 = const Color(0xffF5FEFF),
        shade100 = const Color(0xffEBFDFF),
        shade200 = const Color(0xffD8FAFD),
        shade300 = const Color(0xffC8F5F9),
        shade400 = const Color(0xffB3EDF2),
        shade500 = const Color(0xff82E4EC),
        shade600 = const Color(0xff55CFDA),
        shade700 = const Color(0xff41BBC6),
        shade800 = const Color(0xff009EAB),
        shade900 = const Color(0xff30777D);

  //ERROR COLORS
  MyColors.errorLight()
      : id = 4,
        shade25 = const Color(0xffFFFBFA),
        shade50 = const Color(0xffFEF3F2),
        shade100 = const Color(0xffFEE4E2),
        shade200 = const Color(0xffFECDCA),
        shade300 = const Color(0xffFDA29B),
        shade400 = const Color(0xffF97066),
        shade500 = const Color(0xffF04438),
        shade600 = const Color(0xffD92D20),
        shade700 = const Color(0xffB42318),
        shade800 = const Color(0xff912018),
        shade900 = const Color(0xff7A271A);
  MyColors.errorDark()
      : id = 5,
        shade25 = const Color(0xffFFFBFA),
        shade50 = const Color(0xffFEF3F2),
        shade100 = const Color(0xffFEE4E2),
        shade200 = const Color(0xffFECDCA),
        shade300 = const Color(0xffFDA29B),
        shade400 = const Color(0xffF97066),
        shade500 = const Color(0xffF04438),
        shade600 = const Color(0xffD92D20),
        shade700 = const Color(0xffB42318),
        shade800 = const Color(0xff912018),
        shade900 = const Color(0xff7A271A);

  //WARNING COLORS
  MyColors.warningLight()
      : id = 6,
        shade25 = const Color(0xffFFFCF5),
        shade50 = const Color(0xffFFFAEB),
        shade100 = const Color(0xffFEF0C7),
        shade200 = const Color(0xffFEDF89),
        shade300 = const Color(0xffFEC84B),
        shade400 = const Color(0xffFDB022),
        shade500 = const Color(0xffF79009),
        shade600 = const Color(0xffDC6803),
        shade700 = const Color(0xffB54708),
        shade800 = const Color(0xff93370D),
        shade900 = const Color(0xff7A2E0E);
  MyColors.warningDark()
      : id = 7,
        shade25 = const Color(0xffFFFCF5),
        shade50 = const Color(0xffFFFAEB),
        shade100 = const Color(0xffFEF0C7),
        shade200 = const Color(0xffFEDF89),
        shade300 = const Color(0xffFEC84B),
        shade400 = const Color(0xffFDB022),
        shade500 = const Color(0xffF79009),
        shade600 = const Color(0xffDC6803),
        shade700 = const Color(0xffB54708),
        shade800 = const Color(0xff93370D),
        shade900 = const Color(0xff7A2E0E);

  //SUCCESS COLORS
  MyColors.successLight()
      : id = 8,
        shade25 = const Color(0xffF6FEF9),
        shade50 = const Color(0xffECFDF3),
        shade100 = const Color(0xffD1FADF),
        shade200 = const Color(0xffA6F4C5),
        shade300 = const Color(0xff6CE9A6),
        shade400 = const Color(0xff32D583),
        shade500 = const Color(0xff12B76A),
        shade600 = const Color(0xff039855),
        shade700 = const Color(0xff027A48),
        shade800 = const Color(0xff05603A),
        shade900 = const Color(0xff054F31);
  MyColors.successDark()
      : id = 9,
        shade25 = const Color(0xffF6FEF9),
        shade50 = const Color(0xffECFDF3),
        shade100 = const Color(0xffD1FADF),
        shade200 = const Color(0xffA6F4C5),
        shade300 = const Color(0xff6CE9A6),
        shade400 = const Color(0xff32D583),
        shade500 = const Color(0xff12B76A),
        shade600 = const Color(0xff039855),
        shade700 = const Color(0xff027A48),
        shade800 = const Color(0xff05603A),
        shade900 = const Color(0xff054F31);

  //MOSS COLORS
  MyColors.moss()
      : id = 10,
        shade25 = const Color(0xffFAFDF7),
        shade50 = const Color(0xffF5FBEE),
        shade100 = const Color(0xffE6F4D7),
        shade200 = const Color(0xffCEEAB0),
        shade300 = const Color(0xffACDC79),
        shade400 = const Color(0xff86CB3C),
        shade500 = const Color(0xff669F2A),
        shade600 = const Color(0xff4F7A21),
        shade700 = const Color(0xff3F621A),
        shade800 = const Color(0xff335015),
        shade900 = const Color(0xff2B4212);

  //BLUE LIGHT COLORS
  MyColors.blueLight()
      : id = 11,
        shade25 = const Color(0xffF5FBFF),
        shade50 = const Color(0xffF0F9FF),
        shade100 = const Color(0xffE0F2FE),
        shade200 = const Color(0xffB9E6FE),
        shade300 = const Color(0xff7CD4FD),
        shade400 = const Color(0xff36BFFA),
        shade500 = const Color(0xff0BA5EC),
        shade600 = const Color(0xff0086C9),
        shade700 = const Color(0xff026AA2),
        shade800 = const Color(0xff065986),
        shade900 = const Color(0xff0B4A6F);

  //VIOLET COLORS
  MyColors.violet()
      : id = 12,
        shade25 = const Color(0xffFBFAFF),
        shade50 = const Color(0xffF5F3FF),
        shade100 = const Color(0xffECE9FE),
        shade200 = const Color(0xffDDD6FE),
        shade300 = const Color(0xffC3B5FD),
        shade400 = const Color(0xffA48AFB),
        shade500 = const Color(0xff875BF7),
        shade600 = const Color(0xff7839EE),
        shade700 = const Color(0xff6927DA),
        shade800 = const Color(0xff5720B7),
        shade900 = const Color(0xff491C96);

  //FUCHISA COLORS
  MyColors.fuchisa()
      : id = 13,
        shade25 = const Color(0xffFEFAFF),
        shade50 = const Color(0xffFDF4FF),
        shade100 = const Color(0xffFBE8FF),
        shade200 = const Color(0xffF6D0FE),
        shade300 = const Color(0xffEEAAFD),
        shade400 = const Color(0xffE478FA),
        shade500 = const Color(0xffD444F1),
        shade600 = const Color(0xffBA24D5),
        shade700 = const Color(0xff9F1AB1),
        shade800 = const Color(0xff821890),
        shade900 = const Color(0xff6F1877);

  //PINK COLORS
  MyColors.pink()
      : id = 14,
        shade25 = const Color(0xffFEF6FB),
        shade50 = const Color(0xffFDF2FA),
        shade100 = const Color(0xffFCE7F6),
        shade200 = const Color(0xffFCCEEE),
        shade300 = const Color(0xffFAA7E0),
        shade400 = const Color(0xffF670C7),
        shade500 = const Color(0xffEE46BC),
        shade600 = const Color(0xffDD2590),
        shade700 = const Color(0xffC11574),
        shade800 = const Color(0xff9E165F),
        shade900 = const Color(0xff851651);
}
