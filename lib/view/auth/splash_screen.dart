import 'dart:async';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/view/auth/Login/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = new FlutterSecureStorage();
  bool loading = true;
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(
      _duration,
      navigationPage,
    );
  }

  Future navigationPage() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      Provider.of<DeliveryProvider>(context, listen: false)
          .dataMe(context, token);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginPage()), (_) => false);
    }
  }

  checkUpdate() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // double version = double.parse(packageInfo.version);
    // var res = await Provider.of<DeliveryProvider>(context, listen: false)
    //     .checkUpdate(context);
    // dynamic serverVersion = res["version"];
    // if (version < serverVersion) {
    //   if (res["force"]) {
    //     return showDialog(
    //         barrierDismissible: false,
    //         context: context,
    //         builder: (context) => AlertDialog(
    //               titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //               contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
    //               title: Container(
    //                 padding: EdgeInsets.all(10),
    //                 color: Colors.red[200],
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 30,
    //                       backgroundColor: Colors.red[900],
    //                       child: Icon(
    //                         Icons.error,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 10,
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             'Required Update',
    //                             style: kBoldTextMediumW,
    //                           ),
    //                           Text(
    //                             'Please update.',
    //                             style: kMediumTextSmallerW,
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               content: SingleChildScrollView(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Container(
    //                       child: Text(
    //                         'UPDATE V${res["version"]}',
    //                         style: TextStyle(
    //                             fontFamily: 'Quicksand',
    //                             fontSize: 15,
    //                             color: kSecondayColor,
    //                             fontWeight: FontWeight.w700),
    //                         textAlign: TextAlign.start,
    //                       ),
    //                       decoration: BoxDecoration(
    //                           color: kSecondayColorFaded,
    //                           borderRadius: BorderRadius.circular(5)),
    //                       padding: EdgeInsets.all(5),
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Text(
    //                       'FEATURES',
    //                       style: kBoldText,
    //                     ),
    //                     Text(
    //                       res["updateMessage"],
    //                       style: kMediumTextSmall,
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Text(
    //                       'Please update to continue using Fago Delivery for a better experiance',
    //                       // style: kMediumTextSmallGrey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               actions: <Widget>[
    //                 TextButton.icon(
    //                   icon: Icon(
    //                     Icons.check,
    //                     color: kSecondayColor,
    //                   ),
    //                   label: Text(
    //                     'Update',
    //                     style: TextStyle(color: kSecondayColor),
    //                   ),
    //                   onPressed: () {
    //                     launch(res["applink"]);
    //                   },
    //                 ),
    //               ],
    //               elevation: 0.5,
    //               actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //               clipBehavior: Clip.antiAlias,
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10)),
    //             ));
    //   }
    //   showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //             contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
    //             title: Container(
    //               padding: EdgeInsets.all(10),
    //               // height: 100,
    //               color: Colors.amber[400],
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 30,
    //                     backgroundColor: Colors.amber[700],
    //                     child: Icon(
    //                       Icons.warning,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Expanded(
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Optional Update',
    //                           style: kBoldTextMediumW,
    //                         ),
    //                         Text(
    //                           'Can be skipped',
    //                           style: kMediumTextSmallerW,
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Container(
    //                     child: Text(
    //                       'UPDATE V${res["version"]}',
    //                       style: TextStyle(
    //                           fontFamily: 'Quicksand',
    //                           fontSize: 15,
    //                           color: kSecondayColor,
    //                           fontWeight: FontWeight.w700),
    //                       textAlign: TextAlign.start,
    //                     ),
    //                     decoration: BoxDecoration(
    //                         color: kSecondayColorFaded,
    //                         borderRadius: BorderRadius.circular(5)),
    //                     padding: EdgeInsets.all(5),
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Text(
    //                     'FEATURES',
    //                     style: kBoldText,
    //                   ),
    //                   Text(
    //                     res["updateMessage"],
    //                     style: kMediumTextSmall,
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Text(
    //                     'Would you like to update application to latest version?',
    //                     style: kMediumTextSmallGrey,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             actions: <Widget>[
    //               TextButton(
    //                 child: const Text(
    //                   'Skip',
    //                   style: kMediumTextSmallGrey,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                   startTime();
    //                 },
    //               ),
    //               TextButton.icon(
    //                 icon: Icon(
    //                   Icons.check,
    //                   color: kSecondayColor,
    //                 ),
    //                 label: Text(
    //                   'Update',
    //                   style: TextStyle(color: kSecondayColor),
    //                 ),
    //                 onPressed: () {
    //                   launch(res["applink"]);
    //                 },
    //               ),
    //             ],
    //             elevation: 0.5,
    //             actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //             clipBehavior: Clip.antiAlias,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10)),
    //           ));
    // } else if (version > res["version"]) {
    //   startTime();
    // }
    // if (version == res["version"]) {
    //   startTime();
    // }
    startTime();
  }

  @override
  void initState() {
    checkUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor3,
              image: DecorationImage(
                  image: AssetImage("assets/images/splash copy.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x09000000),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 8), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset("assets/icons/MFS DELIVERYBOY.png")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Maafos Delivery',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Quicksand'),
                    ),
                    Text(
                      'DELIVERY BOYS APP',
                      style: TextStyle(
                          color: kGreyLight,
                          fontSize: 16,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Quicksand'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
