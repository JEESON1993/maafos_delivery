import 'package:maafosdelivery/component/dateUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafosdelivery/component/dummy/orderShimmer.dart';
import 'package:maafosdelivery/component/paymentCard.dart';
import 'package:maafosdelivery/component/zeroState.dart';
import 'package:maafosdelivery/component/zerostatepng.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/component/appBarWidget.dart';
import 'package:maafosdelivery/component/snackBar.dart';
import 'package:maafosdelivery/component/statusCard.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/model/PaymentModel.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:maafosdelivery/helper/date_extension.dart';

class EarningsPage extends StatefulWidget {
  EarningsPage({Key key}) : super(key: key);

  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  ScrollController _scrollController = ScrollController();
  int page = 0;
  bool isPagination = false;
  bool isLoading = true;
  DateTime today = DateTime.now();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  List<Payment> earning = [];
  setDate(DateTime date, type) {
    if (type == 'start') {
      setState(() {
        start = date;
      });
      if (date.isAfter(end)) {
        setState(() {
          end = date;
        });
        return getEarning(start, end, 0);
      }
      getEarning(start, end, 0);
    } else {
      if (date.isBefore(start)) {
        return showSnackBar(
            message: 'End date cannot be before Start date', context: context);
      }
      setState(() {
        end = date;
      });
      getEarning(start, end, 0);
    }
  }

  getEarning(startdate, fromdate, pagecount) async {
    setState(() {
      isLoading = true;
    });
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .getEarning(context, startdate, fromdate, pagecount);
    setState(() {
      isLoading = false;
      earning = List<Payment>.from(res["data"].map((x) => Payment.fromJson(x)));
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  getEarningMore(startdate, fromdate, pagecount) async {
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .getEarning(context, startdate, fromdate, pagecount);
    setState(() {
      isLoading = false;
      earning = earning +
          List<Payment>.from(res["data"].map((x) => Payment.fromJson(x)));
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  @override
  void initState() {
    getEarning(start, end, page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (isPagination) getEarningMore(start, end, page);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarWidget(context,
            title: 'My Earnings', subitle: 'Delivery boy earnings'),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Consumer<DeliveryProvider>(
                builder: (context, data, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusCard(
                          status: data.loadings,
                          title: "Total Earnings",
                          count: data.analysis.data != null
                              ? '₹${data.analysis.data.online ?? "0"}'
                              : '0',
                          icon: "assets/svg/dollar.svg"),
                      StatusCard(
                          status: data.loadings,
                          title: "Completed Orders",
                          count: data.analysis.data != null
                              ? data.analysis.data.ordersCount.toString() ?? '0'
                              : '0',
                          icon: "assets/svg/food.svg"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/earning.svg',
                      height: (20),
                      width: (20),
                      color: kPrimaryColor,
                    ),
                    Text(
                      '  Earnings Details',
                      style: kHeadTitleSmall,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DateUI(
                      title: 'Start Date',
                      type: 'start',
                      today: today,
                      date: start,
                      update: setDate,
                    ),
                    DateUI(
                      title: 'End Date',
                      type: 'end',
                      today: today,
                      date: end,
                      update: setDate,
                    ),
                    if (!start.isSameDate(today))
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              start = DateTime.now();
                              end = DateTime.now();
                            });
                            getEarning(start, end, page);
                          },
                          icon: Icon(Icons.clear),
                          label: Text('Clear')),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              isLoading
                  ? orderShimmer()
                  : earning.length == 0
                      ? zerostatePng(
                          size: 130,
                          height: 370,
                          icon: 'assets/images/noearnings.png',
                          head: 'Feeling Lite!',
                          sub:
                              'You have no earnings for selected dates. Try changing date filter.')
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: earning.length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var item = earning[index];
                            return PaymentCard(item: item);
                          },
                        ),
            ],
          ),
        ));
  }
}
