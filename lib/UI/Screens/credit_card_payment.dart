
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';
class CreditCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardPageState();
  }
}

class CreditCardPageState extends State<CreditCardPage>{
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              CreditCardWidget(

                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                cardBgColor:Colors.white,
                showBackView: isCvvFocused,
                textStyle: TextStyle(color: Colors.black),

              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CreditCardForm(
                    onCreditCardModelChange: onCreditCardModelChange,
                    themeColor: Theme.of(context).primaryColor,

                  ),
                ),
              ),
              InkWell(
                  onTap: ()async{


                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n Payment"),));

                  },
                  child: Container(
                    height:40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff2EB97F),
                    ),
                    child: Text(
                      'Payment',
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                      ),
                    ),

                  )
              )

            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

//{
//  String cardNumber = "";
//  String cardHolderName = "";
//  String expiryDate = "";
//  String cvv = "";
//  bool showBack = false;
//
//  FocusNode _focusNode;
//
//  @override
//  void initState() {
//    super.initState();
//    _focusNode = new FocusNode();
//    _focusNode.addListener(() {
//      setState(() {
//        _focusNode.hasFocus ? showBack = true : showBack = false;
//      });
//    });
//  }
//
//  @override
//  void dispose() {
//    _focusNode.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            SizedBox(
//              height: 40,
//            ),
//            CreditCard(
//              cardNumber: cardNumber,
//              cardExpiry: expiryDate,
//              cardHolderName: cardHolderName,
//              cvv: cvv,
//              bankName: "Axis Bank",
//              showBackSide: showBack,
//              frontBackground: CardBackgrounds.white,
//              backBackground: CardBackgrounds.white,
//              showShadow: true,
//              width: MediaQuery.of(context).size.width,
//              frontTextColor: Colors.black,
//              cardType: CardType.masterCard,
//
//            ),
//            SizedBox(
//              height: 30,
//            ),
//
//            Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                  margin: EdgeInsets.symmetric(
//                    horizontal: 20,
//                  ),
//                  child: TextFormField(
//                    decoration: InputDecoration(hintText: "Card Number"),
//                    maxLength: 16,
//                    keyboardType: TextInputType.number,
//                    onChanged: (value) {
//                      setState(() {
//                        cardNumber = value;
//                      });
//                    },
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.symmetric(
//                    horizontal: 20,
//                  ),
//                  child: TextFormField(
//                    decoration: InputDecoration(hintText: "Card Expiry"),
//                    maxLength: 4,
//                    onChanged: (value) {
//                      setState(() {
//                        expiryDate = value;
//                      });
//                    },
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.symmetric(
//                    horizontal: 20,
//                  ),
//                  child: TextFormField(
//                    decoration: InputDecoration(hintText: "Card Holder Name"),
//                    onChanged: (value) {
//                      setState(() {
//                        cardHolderName = value;
//                      });
//                    },
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                  child: TextFormField(
//                    decoration: InputDecoration(hintText: "CVV"),
//                    maxLength: 3,
//                    onChanged: (value) {
//                      setState(() {
//                        cvv = value;
//                      });
//                    },
//                    focusNode: _focusNode,
//                  ),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}