import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafosdelivery/component/zerostatepng.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/helper/date_extension.dart';
import 'package:maafosdelivery/component/appBarWidget.dart';
import 'package:maafosdelivery/component/dateUI.dart';
import 'package:maafosdelivery/component/dummy/orderShimmer.dart';
import 'package:maafosdelivery/component/settlementCard.dart';
import 'package:maafosdelivery/component/snackBar.dart';
import 'package:maafosdelivery/component/statusCardBig.dart';
import 'package:maafosdelivery/component/zeroState.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/model/SettlementModel.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';

class SettlementPage extends StatefulWidget {
  SettlementPage({Key key}) : super(key: key);

  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  ScrollController _scrollController = ScrollController();
  int page = 0;
  bool isPagination = false;
  bool isLoading = true;
  DateTime today = DateTime.now();
  DateTime start = DateTime.now().subtract(Duration(days: 1));
  DateTime end = DateTime.now().subtract(Duration(days: 1));
  List<Datum> settlement = [];
  setDate(DateTime date, type) {
    if (type == 'start') {
      setState(() {
        start = date;
      });
      if (date.isAfter(end)) {
        setState(() {
          end = date;
        });
        return getSettlement(start, end, 0);
      }
      getSettlement(start, end, 0);
    } else {
      if (date.isBefore(start)) {
        return showSnackBar(
            message: 'End date cannot be before Start date', context: context);
      }
      setState(() {
        end = date;
      });
      getSettlement(start, end, 0);
    }
  }

  getSettlement(startdate, fromdate, pagecount) async {
    setState(() {
      isLoading = true;
    });
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .getSettlement(context, startdate, fromdate, pagecount);
    setState(() {
      isLoading = false;
      settlement = List<Datum>.from(res["data"].map((x) => Datum.fromJson(x)));
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  getSettlemenMore(startdate, fromdate, pagecount) async {
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .getSettlement(context, startdate, fromdate, pagecount);
    setState(() {
      isLoading = false;
      settlement = settlement +
          List<Datum>.from(res["data"].map((x) => Datum.fromJson(x)));
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  @override
  void initState() {
    getSettlement(start, end, page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (isPagination) getSettlemenMore(start, end, page);
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
          title: 'Settlements', subitle: 'Delivery settlement history'),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<DeliveryProvider>(
              builder: (context, data, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusCardBig(
                      status: data.loadings,
                      title: "Cash",
                      count: data.analysis.data != null
                          ? '₹ ${data.analysis.data.cash.toString() ?? "0"}'
                          : '0',
                      title2: "Online",
                      count2: data.analysis.data != null
                          ? '₹ ${data.analysis.data.online.toString() ?? "0"}'
                          : '0',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/settle.svg',
                    height: (20),
                    width: (20),
                    color: kPrimaryColor,
                  ),
                  Text(
                    '  Settlement Details',
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
                  if (!start.isSameDate(today.subtract(Duration(days: 1))))
                    TextButton.icon(
                        onPressed: () {
                          setState(() {
                            start = DateTime.now().subtract(Duration(days: 1));
                            end = DateTime.now().subtract(Duration(days: 1));
                          });
                          // getSettlement(start, end, page);
                        },
                        icon: Icon(Icons.clear),
                        label: Text('Clear'))
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            isLoading
                ? orderShimmer()
                : settlement.length == 0
                    ? zerostatePng(
                        size: 150,
                        height: 370,
                        icon: 'assets/images/noorder.png',
                        head: 'Oh Oo!',
                        sub:
                            'You have no settlement for selected dates. Try changing date filter.')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: settlement.length,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var item = settlement[index];
                          return SettlementCard(item: item);
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
