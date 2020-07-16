import 'package:flutter/material.dart';

class scanning_Nomination_Card extends StatefulWidget {
  @override
  _scanning_Nomination_CardState createState() =>
      _scanning_Nomination_CardState();
}

class _scanning_Nomination_CardState extends State<scanning_Nomination_Card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  'Assets/Qr.jpg.png'
                ),fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 90,top: 60),
                  child: Text('Scanning nomination card',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 50),
                  child: Container(
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: ExactAssetImage(
                          'assets/imags/scan_pic.png'
                      ),),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(
                                'assets/imags/Scanning_nomination_card_2.png'
                            ),fit: BoxFit.cover
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 200,right: 20),
                            child: Text('To validate the papers, the data in the code ',style: TextStyle(
                              color: Color(0xff2EB97F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 45),
                            child: Text("must be extracted for matching",style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*.8,
                              height: 45,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Color(0xff2EB97F),
                                  child: Text(
                                    "Scanning",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Nunito'),
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
