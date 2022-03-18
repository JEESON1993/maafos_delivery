import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:maafosdelivery/component/zerostatepng.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/component/appBarWidget.dart';
import 'package:maafosdelivery/component/dummy/orderShimmer.dart';
import 'package:maafosdelivery/component/orderCard.dart';
import 'package:maafosdelivery/component/statusCard.dart';
import 'package:maafosdelivery/component/zeroState.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  getFCM() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        Provider.of<DeliveryProvider>(context, listen: false).updateFCM(value);
      });
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        Provider.of<DeliveryProvider>(context, listen: false).updateFCM(value);
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getFCM();
    Provider.of<DeliveryProvider>(context, listen: false).deliveryAnalysis();
    Provider.of<DeliveryProvider>(context, listen: false).deliveryOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(
        context,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            return Provider.of<DeliveryProvider>(context, listen: false)
                .refreshAll();
          },
          backgroundColor: Colors.white,
          color: kSecondayColor,
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer<DeliveryProvider>(
                    builder: (context, data, child) => data.loadings == false
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StatusCard(
                                        status: data.loadings,
                                        title: "Today's Earnings",
                                        count: data.analysis.data != null
                                            ? '₹${data.analysis.data.online?.toString() ?? "0"}'
                                            : '0',
                                        icon: "assets/svg/dollar.svg"),
                                    StatusCard(
                                        status: data.loadings,
                                        title: "Today's Orders",
                                        count: data.analysis.data != null
                                            ? data.analysis.data.ordersCount
                                                    .toString() ??
                                                '0'
                                            : '0',
                                        icon: "assets/svg/food.svg"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    StatusCard(
                                        status: data.loadings,
                                        title: "Floating Cash",
                                        count: data.analysis.data != null
                                            ? '₹${data.analysis.data.cash.toString() ?? "0"}'
                                            : '0',
                                        icon: "assets/svg/cash.svg"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                            color: Colors.grey,
                            strokeWidth: 1,
                          )),
                  ),
                  Consumer<DeliveryProvider>(
                    builder: (context, data, child) => data
                            .delivery.delivery.status
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, bottom: 5),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/streaming.svg',
                                      height: (30),
                                      width: (30),
                                      color: kPrimaryColor,
                                    ),
                                    Text(
                                      'Live Orders',
                                      style: kHeadTitleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: data.loading
                                    ? orderShimmer()
                                    : data.todaysOrders.length == 0
                                        ? Container(
                                            height: 350,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Lottie.asset(
                                                  'assets/lottie/searching.json',
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.contain,
                                                ),
                                                Text(
                                                  'Searching..',
                                                  style: kHeadTitleSmall,
                                                ),
                                                Text(
                                                  'Searching for orders',
                                                  style: kMediumText,
                                                ),
                                              ],
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: data.todaysOrders.length,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              var item =
                                                  data.todaysOrders[index];
                                              return OrderCard(item: item);
                                            },
                                          ),
                              ),
                            ],
                          )
                        : zerostatePng(
                            size: 200,
                            height: 300,
                            icon: 'assets/images/noservice.png',
                            head: 'Your not active!',
                            sub:
                                'Looks like you are off duty!, Please turn on to start accepting orders'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
