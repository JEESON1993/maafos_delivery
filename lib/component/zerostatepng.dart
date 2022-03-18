import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafosdelivery/constant/style_constants.dart';

Widget zerostatePng({icon, head, sub, double size = 150, double height = 560}) {
  return Container(
    height: height,
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          height: size,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          head,
          style: kHeadTitleSmall,
        ),
        SizedBox(
          width: 300,
          child: Text(
            sub,
            textAlign: TextAlign.center,
            style: kHintStyle,
          ),
        ),
      ],
    )),
  );
}
