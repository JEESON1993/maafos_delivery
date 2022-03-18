import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/view/auth/splash_screen.dart';
import 'constant/color_constants.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'delivery_channel', // id
    'Maafos Delivery', // title
    'This channel is used for Maafos Delivery.', // description
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('sub'));

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeliveryProvider>(
            create: (context) => DeliveryProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Maafos Delivery',
          theme: ThemeData(
              colorScheme: ColorScheme.light(primary: kPrimaryColor),
              fontFamily: "Gilroy",
              canvasColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                color: Color(0xFFEEEEEE),
              )),
          home: Container(color: Colors.white, child: SplashScreen())),
    );
  }
}
