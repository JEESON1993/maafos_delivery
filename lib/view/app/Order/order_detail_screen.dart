import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/component/dummy/orderDetailShimmer.dart';
import 'package:maafosdelivery/component/rowItem.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/helper/launch_call.dart';
import 'package:maafosdelivery/model/OrderSingleModel.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/helper/string_extension.dart';

class OrderDetailScreen extends StatefulWidget {
  final String id;
  final String type;
  OrderDetailScreen({Key key, this.id, this.type}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  bool isLoading = true;
  OrderSingleModel order;
  getSingleOrder(id, type) async {
    setState(() {
      isLoading = true;
    });
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .getSingleOrder(context, id);
    if (res != null)
      setState(() {
        isLoading = false;
        order = OrderSingleModel.fromJson(res);
      });
    else
      setState(() {
        isLoading = false;
      });
  }

  @override
  void initState() {
    super.initState();
    getSingleOrder(widget.id, widget.type);
  }

  @override
  Widget build(BuildContext context) {
    var outputDate = (date) => DateFormat('d MMM yy, hh:mm a')
        .format(DateTime.parse(date).toUtc().toLocal());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert_rounded),
              onSelected: (int index) {
                // if (index == 1) _showMyDialog(context, order, getSingleOrder);
                if (index == 2)
                  launchUrl('tel://91${order.data.contactNumber}');
                if (index == 3)
                  launchUrl('tel://91${order.data.vendor.contactNumber}');
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Call ${widget.type}".capitalizeAll),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("Call Branch"),
                      value: 3,
                    )
                  ])
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   '${order.data.orderStatus ?? 'Loading'}'.capitalizeAll,
            //   style: kHeadTitleSmallW,
            // ),
            // Text(
            //   isLoading
            //       ? 'Loading'
            //       : '${order.data.orderStatus}, ${order.data.items.length} Items, ₹${order.data.totalAmount?.toDouble()}'
            //           .capitalise,
            //   style: kMediumTextSmallerW,
            // ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => getSingleOrder(widget.id, widget.type),
          backgroundColor: Colors.white,
          color: kSecondayColor,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: isLoading
                ? orderDeatilShimmer()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'ORDER ID ${order.data.orderId}',
                              style: kBoldTextMediumP,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '${outputDate(order.data.createdAt.toString())}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOCATIONS',
                              style: kBoldTextMediumP,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'PICKUP LOCATION'
                                                          .capitalise,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 10,
                                                          color:
                                                              Colors.grey[600]),
                                                    ),
                                                    Text(
                                                      '${order.data.vendor.name}'
                                                          .capitalise,
                                                      style: kMediumText,
                                                    ),
                                                    Text(
                                                      '${order.data.vendor.location.address}'
                                                          .capitalise,
                                                      maxLines: 2,
                                                      style: kHintStyleSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Offstage(
                                              offstage:
                                                  order.data.orderStatus ==
                                                          'delivered' ||
                                                      order.data.orderStatus ==
                                                          'cancelled',
                                              child: IconButton(
                                                  onPressed: () async {
                                                    await MapLauncher.showDirections(
                                                        destinationTitle: order
                                                            .data.vendor.name,
                                                        mapType: Platform.isIOS
                                                            ? MapType.apple
                                                            : MapType.google,
                                                        destination: Coords(
                                                            order
                                                                .data
                                                                .vendor
                                                                .location
                                                                .coordinates[1],
                                                            order
                                                                    .data
                                                                    .vendor
                                                                    .location
                                                                    .coordinates[
                                                                0]));
                                                  },
                                                  icon: Icon(
                                                    Icons.navigation_outlined,
                                                    color: kPrimaryColor,
                                                  )),
                                            )
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/svg/gps1.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'DROP LOCATION'
                                                            .capitalise,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Quicksand',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[600]),
                                                      ),
                                                      Text(
                                                        '${order.data.address.address} ${order.data.address.landmark}'
                                                            .capitalise,
                                                        style: kMediumText,
                                                      ),
                                                      Text(
                                                        '${order.data.address.address
                                                            .capitalise}',
                                                        maxLines: 2,
                                                        style: kHintStyleSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Offstage(
                                                offstage: order.data.orderStatus ==
                                                        'delivered' ||
                                                    order.data.orderStatus ==
                                                        'cancelled',
                                                child: IconButton(
                                                    onPressed: () async {
                                                      await MapLauncher.showDirections(
                                                          destinationTitle:
                                                              'Delivery Location',
                                                          mapType: Platform
                                                                  .isIOS
                                                              ? MapType.apple
                                                              : MapType.google,
                                                          destination: Coords(
                                                              order.data.address
                                                                      .coordinates[
                                                                  0],
                                                              order.data.address
                                                                      .coordinates[
                                                                  1]));
                                                    },
                                                    icon: Icon(
                                                      Icons.navigation_outlined,
                                                      color: kPrimaryColor,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PAYMENT METHOD',
                              style: kBoldTextMediumP,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Payment Type: ${order.data.paymentType}"
                                  .capitalizeAll,
                              style: kMediumTextSmall,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ITEMS',
                              style: kBoldTextMediumP,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ...order.data.items
                                .map((e) => rowItem(
                                    title: '${e.name}',
                                    price: e.offerPrice != null
                                        ? e.offerPrice * e.qty
                                        : e.maafosPrice * e.qty,
                                    count: e.qty,
                                    bold: false))
                                .toList(),
                            Divider(),
                            rowItem(
                                title: 'Delivery Charge',
                                price: order.data.deliveryCharge,
                                bold: false),
                            Divider(),
                            rowItem(
                                title: 'Amount Payable',
                                titleBold: true,
                                price: order.data.totalAmount,
                                bold: true),
                            SizedBox(
                              height: 30,
                            ),
                            Offstage(
                              offstage: order.data.orderStatus == 'delivered',
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: kSecondayColor,
                                      elevation: 0,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(3),
                                      ),
                                    ),
                                    onPressed: () => launchUrl(
                                        'tel://91${order.data.customer.user}'),
                                    child: Text('Call Customer')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
