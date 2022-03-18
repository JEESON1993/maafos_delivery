import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:maafosdelivery/constant/color_constants.dart';
import 'package:maafosdelivery/constant/style_constants.dart';
import 'package:maafosdelivery/provider/DeliveryProvider.dart';
import 'package:provider/provider.dart';

class PasaswordScreen extends StatefulWidget {
  PasaswordScreen({Key key}) : super(key: key);

  @override
  _PasaswordScreenState createState() => _PasaswordScreenState();
}

class _PasaswordScreenState extends State<PasaswordScreen> {
  TextEditingController passwordController = new TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future _changePassword() async {
    if (formkey.currentState.validate()) {
      String password = passwordController.text.trim();
      Map<String, dynamic> body = {"newPassword": password};
      Provider.of<DeliveryProvider>(context, listen: false)
          .changePassword(context, body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
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
          'Change Password',
          style: kHeadTitleSmallW,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: RequiredValidator(errorText: 'Password is Required'),
                controller: passwordController,
                obscureText: true,
                style: kMediumText,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[140],
                    border: kOutlineStyle,
                    hintText: 'Password',
                    hintStyle: kHintStyle),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  child: Text(
                    'Update Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _changePassword();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
