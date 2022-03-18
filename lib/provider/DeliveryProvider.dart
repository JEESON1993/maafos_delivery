// ignore_for_file: missing_required_param

import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:maafosdelivery/model/OrderSingleModel.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:maafosdelivery/component/snackBar.dart';
import 'package:maafosdelivery/constant/app_constants.dart';
import 'package:maafosdelivery/model/AnalysisModel.dart';
import 'package:maafosdelivery/model/DeliveryModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:maafosdelivery/model/OrderCardModel.dart';
import 'package:maafosdelivery/view/app/bottom_navigation.dart';
import 'package:maafosdelivery/view/auth/Login/login_screen.dart';

class DeliveryProvider extends ChangeNotifier {
  bool loading = true;
  bool loadings = true;
  List<Datum> todaysOrders = [];
  List<Datum> pastOrders = [];
  AnalysisModel analysis = AnalysisModel();
  final storage = new FlutterSecureStorage();
  DeliveryModel delivery = DeliveryModel();
  OrderSingleModel singleModel;
  IO.Socket socket;

  // //* CONNECT BRANCH SOCKET
  // _connectSocket(id, BuildContext context) {
  //   socket = IO.io(socketUrl, <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.onConnect(
  //     (data) => socket.emit('join', 'delivery_$id'),
  //   );
  //   socket.onConnect(
  //     (data) => print('connected'),
  //   );
  //   socket.on('orderUpdate', (data) {
  //     if (data["status"] == 'assigned') {
  //  HapticFeedback.heavyImpact();
  //       deliveryOrders();
  //       return playLocalAsset("sound2.mp3");
  //     }
  //     if (data["status"] == 'update') {
  //       HapticFeedback.heavyImpact();
  //       deliveryOrders();
  //       return playLocalAsset("sound3.mp3");
  //     }
  //   });
  // }

  Future<AudioPlayer> playLocalAsset(val) async {
    AudioCache cache = new AudioCache();
    return await cache.play(val);
  }

  Future changePassword(BuildContext context, body) async {
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(baseUrl, apiUrl + "/delivery/password");
    final response = await http.put(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      Navigator.pop(context);
      return showSnackBar(
          context: context, message: 'Password Changed Successfully');
    }
    showSnackBar(context: context, message: 'Something went wrong');
  }

  Future checkUpdate(
    context,
  ) async {
    final Uri url = Uri.https(baseUrl, apiUrl + "/branch/appversion",
        {"app": "delivery", "platform": Platform.operatingSystem.toString()});
    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    var jsonData = jsonDecode(response.body);
    return jsonData["data"];
  }

  Future loginUser(BuildContext context, body) async {
    DeliveryModel result;
    final Uri url = Uri.https(baseUrl, apiUrl + "/auth/user-login");
    final response = await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      showSnackBar(context: context, message: 'success');
      print(data["token"]);
      await storage.write(key: "token", value: data["token"]);
      return dataMe(context, data["token"]);
    }
    if (response.statusCode == 401) {
      // return showSnackBar(context: context, message: data['error']['messge']);
      showSnackBar(context: context, message: 'Done');
    }
    return result;
  }

  Future refreshAll() async {
    loading = true;
    loadings = true;
    deliveryAnalysis();
    deliveryOrders();
    deliveryPastOrders('delivered', 0, false);
    notifyListeners();
  }

  Future<DeliveryModel> dataMe(BuildContext context, token) async {
    DeliveryModel result;
    final Uri url = Uri.https(baseUrl, apiUrl + "/delivery/me");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // _connectSocket(data["delivery"]["_id"], context);
      delivery = DeliveryModel.fromJson(data);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigation(),
          ),
          (_) => false);
    }
    if (response.statusCode == 401) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (_) => false);
    }
    return result;
  }

  Future switchStatus(BuildContext context, status) async {
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(baseUrl, apiUrl + "/delivery/status",
        {"type": "restaurant", "status": status.toString()});
    final response = await http.put(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    if (status) {
      // deliveryAnalysis();
    }
    if (response.statusCode == 200) {
      delivery.delivery.status = status;
      showSnackBar(context: context, message: data["message"]);
      return notifyListeners();
    }
    if (response.statusCode == 401) {
      showSnackBar(context: context, message: 'Something went wrong');
    }
  }

  Future updateFCM(fcmtoken) async {
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(
      baseUrl,
      apiUrl + "/delivery/me",
    );
    final response =
        await http.put(url, body: jsonEncode({"fcmToken": fcmtoken}), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print('FCM UPDATED');
    }
  }

  Future deliveryAnalysis() async {
    loadings = true;
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "token");
    final Uri url = Uri.parse(
      "https://maafos.live/api/v1/delivery/analysis?dBoyId=${delivery.delivery.id}",
    );
    final response = await http.get(url,
        headers: {'Authorization': 'Bearer $token', 'Cookie': 'token=$token'});
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      analysis = AnalysisModel.fromJson(data);
      loadings = false;

      print(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
    }
    notifyListeners();
  }

  Future deliveryOrders() async {
    loading = true;
    loadings = true;
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(
        baseUrl, apiUrl + "/order/delivery/status", {"type": 'today'});
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      todaysOrders =
          List<Datum>.from(data["data"].map((x) => Datum.fromJson(x)));
      loading = false;
      loadings = false;
    } else {
      loading = false;
    }
    notifyListeners();
  }

  Future deliveryPastOrders(type, page, loadmore) async {
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(baseUrl, apiUrl + "/order/delivery/status", {
      "type": type.toString(),
      "page": (page + 1).toString(),
      "limit": '10'
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loading = false;
      if (loadmore)
        pastOrders = pastOrders +
            List<Datum>.from(data["data"].map((x) => Datum.fromJson(x)));
      else
        pastOrders =
            List<Datum>.from(data["data"].map((x) => Datum.fromJson(x)));
      return data;
    }
    notifyListeners();
  }

  Future updateOrderStatus(
      BuildContext context, String type, String oid) async {
    String token = await storage.read(key: "token");

    var headers = {
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://maafos.live/api/v1/order/delivery/order?orderId=$oid&type=$type'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      loading = false;
      deliveryOrders();
      deliveryPastOrders('delivered', 0, false);
      showSnackBar(context: context, message: 'Order updated');

      // deliveryAnalysis();
    } else {
      print(response.reasonPhrase);

      loadings = false;
    }
    notifyListeners();
  }

  // Future addDelay(BuildContext context, String oid, body) async {
  //   final storage = new FlutterSecureStorage();
  //   String token = await storage.read(key: "token");
  //   final Uri url =
  //       Uri.https(baseUrl, apiUrl + "/order/delivery/delay", {"id": oid});
  //   final response = await http.put(url, body: jsonEncode(body), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   if (response.statusCode == 200) {
  //     loading = false;
  //     deliveryOrders();
  //     deliveryPastOrders('delivered', 0, false);
  //     deliveryAnalysis();
  //   } else {
  //     loading = false;
  //   }
  //   notifyListeners();
  // }

  Future getSingleOrder(BuildContext context, String oid) async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(baseUrl, apiUrl + "/order/$oid");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      singleModel = OrderSingleModel.fromJson(data["data"]);
      return data;
    }
  }

  Future getSettlement(BuildContext context, from, to, page) async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "token");
    final Uri url = Uri.https(baseUrl, apiUrl + "/settlement/delivery", {
      "from": from.toString(),
      "to": to.toString(),
      "page": (page + 1).toString(),
      "limit": '10'
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    return data;
  }

  Future getEarning(BuildContext context, from, to, page) async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: "token");
    // final Uri url = Uri.https(baseUrl, apiUrl + "/settlement/delivery/pay", {
    final Uri url = Uri.https(baseUrl, apiUrl + "/settlement/delivery", {
      "from": '2021-08-29',
      "to": '2021-12-31',
      "page": (page + 1).toString(),
      "limit": '10'
    });
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode(response.body);
    return data;
  }
}
