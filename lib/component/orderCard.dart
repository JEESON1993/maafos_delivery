// ignore_for_file: unused_import, unused_local_variable, unused_element

import 'dart:io';

import 'package:maafosdelivery/component/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/helper/string_extension.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/model/OrderCardModel.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/view/app/Order/order_detail_screen.dart';

class OrderCard extends StatelessWidget {
  final Datum item;
  const OrderCard({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getmodel = Provider.of<DeliveryProvider>(context, listen: false);
    var outputDate = (date) => DateFormat('d MMM yy, hh:mm a')
        .format(DateTime.parse(date).toUtc().toLocal());

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderDetailScreen(
                  id: item.id,
                )),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.7, color: kGreyLighter),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   item.customer.name.capitalizeAll,
                      //   style: kBoldTextMedium,
                      // ),
                      // Text(
                      //   '${item.orderStatus}'.capitalizeAll,
                      //   style: TextStyle(
                      //       fontFamily: 'Quicksand',
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.w700,
                      //       color: item.orderStatus == 'delivered'
                      //           ? kSecondayColor
                      //           : item.orderStatus == 'cancelled'
                      //               ? Colors.red[900]
                      //               : kPrimaryColor),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${outputDate(item.createdAt.toString())}'),
                        Text(
                          '${item.orderId}',
                          style: kBoldTextMedium.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/bag.svg",
                              height: 18,
                              width: 18,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              ' Items  ',
                              style:
                                  kBoldTextMedium.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${item.items.length}',
                              style: kBoldTextMediumW.copyWith(
                                  color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: item.orderStatus == 'delivered',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/gps2.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'PICKUP LOCATION'.capitalise,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10,
                                                color: Colors.grey[600]),
                                          ),
                                          // if (item.type == 'restaurant')
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${item.vendor.name}'
                                                    .capitalise,
                                                style: kMediumText,
                                              ),
                                              Text(
                                                '${item.vendor.location.address}'
                                                    .capitalise,
                                                maxLines: 2,
                                                style: kHintStyleSmall,
                                              ),
                                            ],
                                          ),
                                          // if (item.type == 'grocery')
                                          //   Column(
                                          //     children: [
                                          //       Text(
                                          //         '${item..branch?.name}'
                                          //             .capitalise,
                                          //         style: kMediumText,
                                          //       ),
                                          //       Text(
                                          //         '${item?.branch?.address?.location}'
                                          //             .capitalise,
                                          //         maxLines: 2,
                                          //         style: kHintStyleSmall,
                                          //       ),
                                          //     ],
                                          //   ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // IconButton(
                                  //     onPressed: () async {
                                  //       await MapLauncher.showDirections(
                                  //           destinationTitle:
                                  //               item.ven == 'restaurant'
                                  //                   ? item.vendorId.name
                                  //                   : item.branch.name,
                                  //           mapType: Platform.isIOS
                                  //               ? MapType.apple
                                  //               : MapType.google,
                                  //           destination:
                                  //               item.type == 'restaurant'
                                  //                   ? Coords(
                                  //                       item.vendorId.address
                                  //                           .coordinates[1],
                                  //                       item.vendorId.address
                                  //                           .coordinates[0])
                                  //                   : Coords(
                                  //                       item.branch.address
                                  //                           .coordinates[1],
                                  //                       item.branch.address
                                  //                           .coordinates[0]));
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.navigation_outlined,
                                  //       color: kPrimaryColor,
                                  //     ))
                                ],
                              ),
                              Container(
                                  height: 25,
                                  child: VerticalDivider(
                                    color: kSecondayColor,
                                    thickness: 1,
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/gps1.svg',
                                      height: 20,
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'DROP LOCATION'.capitalise,
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 10,
                                                  color: Colors.grey[600]),
                                            ),
                                            Text(
                                              '${item.address.address} ${item.address.landmark}'
                                                  .capitalise,
                                              style: kMediumText,
                                            ),
                                            Text(
                                              '${item.address.address}'
                                                  .capitalise,
                                              maxLines: 2,
                                              style: kHintStyleSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await MapLauncher.showDirections(
                                              destinationTitle:
                                                  'Delivery Location',
                                              mapType: Platform.isIOS
                                                  ? MapType.apple
                                                  : MapType.google,
                                              destination: Coords(
                                                  item.address.coordinates[0],
                                                  item.address.coordinates[1]));
                                        },
                                        icon: Icon(
                                          Icons.navigation_outlined,
                                          color: kPrimaryColor,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: item.orderStatus != 'ready',
              child: Container(
                padding: EdgeInsets.all(5),
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: () => getmodel.updateOrderStatus(
                        context, 'ondelivery', item.id),
                    child: Text('Start Delivery')),
              ),
            ),
            Offstage(
              offstage: item.orderStatus != 'on delivery',
              child: Container(
                padding: EdgeInsets.all(5),
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kSecondayColor,
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: () {
                      showSnackBar(
                          message: 'Long press to Continue', context: context);
                    },
                    onLongPress: () => _showMyDialog(context, item),
                    child: Text('Delivery Complete')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, Datum item) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      GlobalKey<FormState> formkey = GlobalKey<FormState>();
      var getmodel = Provider.of<DeliveryProvider>(context, listen: false);
      deliverOrder() {
        getmodel.updateOrderStatus(
          context,
          'delivered',
          item.id,
        );
        Navigator.of(context).pop();
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            scrollable: true,
            titlePadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Method',
                        style: kHeadTitleMedium,
                      ),
                      IconButton(
                          constraints: BoxConstraints.tightFor(),
                          padding: EdgeInsets.all(0),
                          iconSize: 20,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.close))
                    ],
                  ),
                  Text(
                    'Order Amount: ₹${item.totalAmount.toDouble()}',
                    style: kBoldTextLarge,
                  ),
                  Text(
                    'Payment Type: ${item.paymentType ?? 'Cash'}',
                    style: kBoldTextLarge,
                  ),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: ListBody(
                  children: <Widget>[
                    if (item.paymentType == 'Cash on Delivery')
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Please Collect Cash on Delivery amount from customer.',
                          style: kMediumTextSmall,
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kSecondayColor,
                          elevation: 0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(3),
                          ),
                        ),
                        onPressed: () => deliverOrder(),
                        child: Text('Complete Delivery')),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> _showMyPendingDialog(BuildContext context, Datum item) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      TextEditingController reasonController = new TextEditingController();
      String pendingType = '';
      var getmodel = Provider.of<DeliveryProvider>(context, listen: false);
      pendingOrder() {
        String reason = reasonController.text.trim();
        var data = pendingType == 'others'
            ? {
                "reason": reason,
                "type": "others",
              }
            : {
                "reason": pendingType,
                "type": "pending",
              };
        // getmodel.updateOrderStatus(context, 'pending', item.id, data);
        Navigator.of(context).pop();
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            scrollable: true,
            titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Order Issue',
              style: kHeadTitleMedium,
            ),
            content: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Please select the reson for pending this order',
                        style: kMediumTextSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(right: 10),
                            child: Radio(
                              value: 'not available',
                              groupValue: pendingType,
                              onChanged: (value) {
                                setState(() {
                                  pendingType = value;
                                });
                              },
                            ),
                          ),
                          Text('Customer not available')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(right: 10),
                            child: Radio(
                              value: 'no contact',
                              groupValue: pendingType,
                              onChanged: (value) {
                                setState(() {
                                  pendingType = value;
                                });
                              },
                            ),
                          ),
                          Text('Customer not accepting call')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(right: 10),
                            child: Radio(
                              value: 'wrong address',
                              groupValue: pendingType,
                              onChanged: (value) {
                                setState(() {
                                  pendingType = value;
                                });
                              },
                            ),
                          ),
                          Text('Wrong delivery location')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: EdgeInsets.only(right: 10),
                            child: Radio(
                              value: 'others',
                              groupValue: pendingType,
                              onChanged: (value) {
                                setState(() {
                                  pendingType = value;
                                });
                              },
                            ),
                          ),
                          Text('Others')
                        ],
                      ),
                    ),
                    if (pendingType == 'others')
                      TextFormField(
                        controller: reasonController,
                        style: kMediumText,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[140],
                            border: kOutlineStyle,
                            hintText: 'Specify your reason for cancellation',
                            hintStyle: kHintStyle),
                      ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Submit'),
                onPressed: pendingType != '' ? () => pendingOrder() : null,
              ),
            ],
          );
        },
      );
    },
  );
}
