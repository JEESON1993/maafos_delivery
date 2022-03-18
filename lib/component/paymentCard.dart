import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/model/PaymentModel.dart';
import 'package:maafosdelivery/helper/string_extension.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Payment item;

  @override
  Widget build(BuildContext context) {
    var outputDate = (date) =>
        DateFormat('d MMM yy').format(DateTime.parse(date).toUtc().toLocal());

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 0.5, color: kGreyLighter),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                    side: BorderSide(width: 1, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(40)),
                color: kPrimaryColorFaded),
            padding: EdgeInsets.all(5),
            height: 70,
            width: 70,
            alignment: Alignment.center,
            child: Text(
              '${outputDate(item.createdAt.toString())}',
              textAlign: TextAlign.center,
              style: kBoldTextMediumP,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Wrap(
              direction: Axis.horizontal, // make sure to set this
              runSpacing: 5,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: kBoldTextMedium,
                    ),
                    Text(
                      '${item.status}'.capitalizeAll,
                      style: kBoldTextMediumP,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earnings: ₹${item.totalEarning}',
                      style: kMediumTextSmall,
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
