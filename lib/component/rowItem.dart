// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:maafosdelivery/constant/style_constants.dart';

Widget rowItem({title, price, bold, count = null, titleBold = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (count != null)
                Text(
                  '$count x ',
                  style: kHeadTitleSmall,
                ),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: titleBold ? kBoldTextMedium : kMediumTextSmall,
                ),
              ),
            ],
          ),
        ),
        Text(
          '₹${price?.toDouble()}',
          style: bold == true ? kBoldTextMedium : kHintStyleSmall,
        )
      ],
    ),
  );
}
