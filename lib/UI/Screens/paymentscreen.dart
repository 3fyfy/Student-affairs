import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {

  final int price;

  PaymentScreen(this.price);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String _loadHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="http://127.0.0.1:8000/pay">
            <input type="hidden" name="price" value="${widget.price}" />
          </form>
        </body>
      </html>
    ''';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        onPageFinished: (page){

          if(page.contains('/success')){
            Navigator.of(context).pop();
          }
        },
        javascriptMode: JavascriptMode.unrestricted,
        //initialUrl: new Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),

        initialUrl: 'https://www.sandbox.paypal.com/eg/signin',

      )
    );
  }
}
