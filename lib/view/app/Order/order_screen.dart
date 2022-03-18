import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maafosdelivery/component/zerostatepng.dart';
import 'package:provider/provider.dart';
import 'package:maafosdelivery/component/appBarWidget.dart';
import 'package:maafosdelivery/component/dummy/orderShimmer.dart';
import 'package:maafosdelivery/component/orderCard.dart';
import 'package:maafosdelivery/component/zeroState.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int page = 0;
  bool isPagination = false;
  ScrollController _scrollController = ScrollController();

  getOrders() async {
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .deliveryPastOrders('delivered', page, false);
    setState(() {
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  getMoreOrders() async {
    var res = await Provider.of<DeliveryProvider>(context, listen: false)
        .deliveryPastOrders('delivered', page, true);
    setState(() {
      isPagination = res['pagination']['next'] != null ? true : false;
      page = res['pagination']['next'] != null ? page + 1 : page;
    });
  }

  @override
  void initState() {
    getOrders();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (isPagination) getMoreOrders();
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
      appBar: appBarWidget(context,
          title: 'Order History', subitle: 'Previous delivery history'),
      backgroundColor: Colors.white,
      body: Consumer<DeliveryProvider>(
        builder: (context, data, child) => data.loading
            ? orderShimmer()
            : data.pastOrders.length == 0
                ? zerostatePng(
                    size: 150,
                    icon: 'assets/images/noorder.png',
                    head: 'Swoosh!',
                    sub: 'You have no past orders. Start delivering today')
                : ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: data.pastOrders.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var item = data.pastOrders[index];
                      return OrderCard(item: item);
                    },
                  ),
      ),
    );
  }
}
