import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/constant/app_constants.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/view/app/Settings/settings_screen.dart';

Widget appBarWidget(BuildContext context,
    {String subitle, String title, bottom}) {
  return AppBar(
      bottom: bottom,
      titleSpacing: 0,
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: kPrimaryColor,
      title: Consumer<DeliveryProvider>(
        builder: (context, data, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundColor: kPrimaryColorFaded,
                          backgroundImage: NetworkImage(
                              awsUrl + data.delivery.delivery.profilePic.key),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title != null
                                ? title
                                : 'Hi, ${data.delivery.delivery.name}',
                            style:
                                kHeadTitleMediumW.copyWith(color: Colors.black),
                          ),
                          Text(
                            subitle != null
                                ? subitle
                                : 'Delivery Boy Executive, ' +
                                    data.delivery.delivery.name,
                            maxLines: 1,
                            style: kMediumTextSmallerW.copyWith(
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (title == null)
                CupertinoSwitch(
                    activeColor: Colors.white,
                    thumbColor: Colors.black87,
                    value: data.delivery.delivery.status,
                    onChanged: (val) {
                      data.switchStatus(context, val);
                    })
            ],
          ),
        ),
      ));
}
