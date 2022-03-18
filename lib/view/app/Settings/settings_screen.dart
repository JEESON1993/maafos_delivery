// ignore_for_file: unused_import

import 'package:maafosdelivery/view/app/Settings/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/view/app/Settings/profile_screen.dart';
import 'package:maafosdelivery/view/auth/Login/login_screen.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
        ),
        title: Text(
          'Settings',
          style: kHeadTitleSmallW,
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            ),
            tileColor: Colors.white,
            minLeadingWidth: 0,
            leading: SvgPicture.asset(
              'assets/svg/user.svg',
              height: 20,
              width: 20,
              color: kPrimaryColor,
            ),
            title: Text(
              'Profile',
              style: kMediumText,
            ),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasaswordScreen()),
            ),
            tileColor: Colors.white,
            minLeadingWidth: 0,
            leading: SvgPicture.asset(
              'assets/svg/password.svg',
              height: 20,
              width: 20,
              color: kPrimaryColor,
            ),
            title: Text(
              'Change Password',
              style: kMediumText,
            ),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          ListTile(
            tileColor: Colors.white,
            minLeadingWidth: 0,
            leading: SvgPicture.asset(
              'assets/svg/logout.svg',
              height: 20,
              width: 20,
              color: kPrimaryColor,
            ),
            title: Text(
              'Logout',
              style: kMediumText,
            ),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () async {
              // Provider.of<DeliveryProvider>(context, listen: false)
              //     .updateFCM('');
              FlutterSecureStorage storage = FlutterSecureStorage();
              await storage.deleteAll();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (_) => false);
            },
          )
        ]).toList(),
      ),
    );
  }
}
