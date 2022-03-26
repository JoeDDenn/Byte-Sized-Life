import 'package:flutter/material.dart';
import 'package:solutionchallenge/presentation/screen/screenVideo.dart';

import '../../constant/input.dart';
import 'WebView.dart';
class ScreenZeroToThree extends StatefulWidget {
  const ScreenZeroToThree({Key? key}) : super(key: key);

  @override
  State<ScreenZeroToThree> createState() => _ScreenZeroToThreeState();
}

class _ScreenZeroToThreeState extends State<ScreenZeroToThree> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return  Scaffold(
      backgroundColor: const Color(0xff00196b),
      body: buildStack(context , Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    WebViewExample('https://parentingscience.com/baby-sign-language/')
                ));

              },
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image:  AssetImage('assets/images/3.jpg') ,
                      width: 300,
                    ),
                    Text("Sign Language for babies" ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                VideoApp()
                ));
              },
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image:  NetworkImage('https://img.freepik.com/free-photo/portrait-cheerful-baby-bed_13339-254433.jpg?w=1060') ,
                      width: 300,
                    ),
                    Text("Videos Sign Language for babies" ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),



                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    WebViewExample('https://home.oxfordowl.co.uk/kids-activities/learning-activities-for-toddlers/')
                ));

              },
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image:  NetworkImage('https://img.freepik.com/free-photo/full-shot-woman-talking-baby_23-2149320499.jpg?t=st=1648318681~exp=1648319281~hmac=0fda099428113bd1141e3d0012e02d871d9b1c0f55e1c551c63f02556bb073d8&w=1060') ,
                      width: 300,
                    ),
                    Text("fun learning ideas" ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)

                  ],
                ),
              ),
            ),
          ],
        ),

      )),
    );
  }
}
