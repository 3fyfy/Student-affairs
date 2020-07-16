import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/credit_card_payment.dart';
import 'package:gradution_app/UI/Screens/paymentscreen.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';

class registration_Fees extends StatefulWidget {
 final int fees;

  registration_Fees(this.fees);

  @override
  _registration_FeesState createState() => _registration_FeesState();
}

String _radioValue; //Initial definition of radio button value
String choice;

class _registration_FeesState extends State<registration_Fees> {
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Registration fees",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();
        }),
      ),


      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height *.3,
            padding:  EdgeInsets.only(right:width*.05,left: width*.05,top:10),
            color: Color(0xff48CFAF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "The amount of fees for this year ${widget.fees} EGP",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    Container(
                      height: height*.2,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("Assets/imags/fee_pic.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Text(""),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom:height*.02),
                  child: Text(
                    "Please select a payment method",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,

                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(right:width*.05,left: width*.05,top:10),
            child: Column(

              children: <Widget>[
                RadioListTile(
                    value: 'Credit Card',
                    title: Text(
                      'Credit Card',
                      style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
                    ),
                    activeColor: Color(0xff2EB97F),
                    secondary: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(
                                    'Assets/imags/Credit_Card_pic.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges),
                Divider(thickness: 1,),

                RadioListTile(
                    value: 'Paypal',
                    title: Text(
                      'Paypal',
                      style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
                    ),
                    activeColor: Color(0xff2EB97F),
                    secondary: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(
                                    'Assets/imags/paypal_pic.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges),
                Divider(thickness: 1,),



                RadioListTile(
                    value: 'Vodafone cash',
                    title: Text(
                      'Vodafone cash',
                      style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
                    ),
                    activeColor: Color(0xff2EB97F),
                    secondary: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 55,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ExactAssetImage(
                                    'Assets/imags/Vodafone_cash_pic.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges),
                Divider(thickness: 1,),


                InkWell(
                  onTap: (){
                    if(_radioValue=="Paypal")
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(300),));
                    if(_radioValue=="Credit Card")
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreditCardPage(),));


                  },
                  child: Container(
                    padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                    //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                    height:40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'Credit Card':
          choice = value;
          break;
        case 'Paypal':
          choice = value;
          break;
        case 'Vodafone cash':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
}
