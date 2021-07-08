import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:groceries_shopping_app/appTheme.dart';
import 'package:groceries_shopping_app/widgets/IllustraionContainer.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse('http://ec2-65-2-10-243.ap-south-1.compute.amazonaws.com/messages');
var response = await http.post(url, body: {"method": "get","path": "/v1/payment_methods/country?country=US&currency=USD"});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.parse('https://example.com/foobar.txt')));
import '../product_provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> with AfterLayoutMixin<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () => awesomeDialog(context));
  }

  int _randomGeneratedCode() {
    Random random = new Random();
    return random.nextInt(10000000);
  }

  AwesomeDialog awesomeDialog(BuildContext context) {
    return AwesomeDialog(
      btnOkColor: Theme.of(context).primaryColor,
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      autoHide: Duration(minutes: 10),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your order has been placed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text('Check your E-mail for confirmation.'),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  "Your Order Number is \n#" +
                      _randomGeneratedCode().toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IllustrationContainer(
                    path: AppTheme.checkingoutSVG,
                    reduceSizeByHalf: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // btnOk: _buildFancyButtonOk,
      onDissmissCallback: () {
        Provider.of<ProductsOperationsController>(context, listen: false)
            .clearCart();
        Navigator.pop(context);
      },
    )..show();
  }
}
