import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

import '../login Screen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> image =[
    'assets/images/1.png',
    'assets/images/2.png',

  ];

  List<String> text =[
    'The most important thing parents can do is to keep communicating " -Ronnie J. Rough',
    'The site is concerned with education for children from 0-16 years old in such a section, including sexual education, sign language and the skills needed to be acquired by children to develop their mind and skills',

  ];

  var boardController = PageController();
  int  ? index = 0;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: ConcentricPageView(
          colors: <Color>[Colors.white, Color(0xffbdd0fb),Colors.pink],
          itemCount: image.length, // null = infinity
          physics: NeverScrollableScrollPhysics(),
          onChange: (value){
            setState(() {
              index = value;
            });
          },
          itemBuilder: (int index, double value) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(image: AssetImage(image[index] ),width: 300),
                    ),
                    Text(
                        text[index],style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    (index == text.length-1)? TextButton(onPressed: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                      LoginScreen()

                      ));
                    },
                        child: Text("Start" , style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),)
                    ) :SizedBox()

                  ],
                ),
              )
            );
          },
        )
      ),
    );
  }
}
