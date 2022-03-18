import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:maafosdelivery/constant/color_constants.dart';

Widget orderShimmer() {
  return Shimmer.fromColors(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(10),
              height: 180,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(10),
              height: 180,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(10),
              height: 180,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(10),
              height: 180,
            ),
          ],
        ),
      ),
      baseColor: kGreyLightest,
      highlightColor: kGreyLighter);
}
