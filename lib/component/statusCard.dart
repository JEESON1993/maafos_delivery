import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';

class StatusCard extends StatelessWidget {
  final title;
  final count;
  final icon;
  final status;
  const StatusCard({
    Key key,
    String this.title,
    String this.count,
    String this.icon,
    bool this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color(0x18818181),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
          color: kPrimaryColorFaded,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(width: 1, color: kPrimaryColor)),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        height: 120,
        child: Stack(
          children: [
            status
                ? Shimmer.fromColors(
                    baseColor: kPrimaryColor3,
                    highlightColor: kPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          width: 70,
                          height: 20,
                        ),
                        Container(
                          width: 120,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        count.toString(),
                        style: kHeadTitleP,
                      ),
                      Text(
                        title,
                        style: kMediumText,
                      )
                    ],
                  ),
            Positioned(
              right: 0,
              child: SvgPicture.asset(
                icon,
                height: (60),
                width: (60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
