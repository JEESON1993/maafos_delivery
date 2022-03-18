import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';

class StatusCardBig extends StatelessWidget {
  final title;
  final count;
  final title2;
  final count2;
  final icon;
  final status;
  const StatusCardBig({
    Key key,
    String this.title,
    String this.count,
    String this.title2,
    String this.count2,
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
          color: kPrimaryColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(width: 1, color: kPrimaryColor)),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        height: 110,
        child: Stack(
          children: [
            status
                ? Shimmer.fromColors(
                    baseColor: kPrimaryColor3,
                    highlightColor: kPrimaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              width: 60,
                              height: 15,
                            ),
                            Container(
                              width: 80,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              width: 60,
                              height: 15,
                            ),
                            Container(
                              width: 80,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              width: 60,
                              height: 15,
                            ),
                            Container(
                              width: 80,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            count,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          Text(
                            title,
                            style: kMediumTextSmallerW.copyWith(
                                color: Colors.black),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            count2,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          Text(
                            title2,
                            style: kMediumTextSmallerW.copyWith(
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
