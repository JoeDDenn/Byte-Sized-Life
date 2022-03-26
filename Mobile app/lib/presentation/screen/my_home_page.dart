import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:solutionchallenge/constant/input.dart';
import 'package:solutionchallenge/presentation/resources/assets/assetclass.dart';
import 'package:solutionchallenge/presentation/resources/text_manager.dart';
import 'package:solutionchallenge/presentation/resources/value_manager.dart';
import 'package:solutionchallenge/presentation/screen/my_home_page.dart';
import 'package:solutionchallenge/presentation/screen/screenVideo.dart';
import 'package:solutionchallenge/shared/bloc/AppCupit.dart';

import '../../shared/bloc/AppStates.dart';
import '0_3Screen.dart';
import '3-6Screen.dart';
import 'login Screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return BlocConsumer<AppCubit,AppState>(listener: (context, state) {

    },
      builder: (context ,state){
      return SafeArea(
        child: Scaffold(
          key: _key,
          drawer:  Drawer(
            backgroundColor: const Color(0xff00196b),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Button(
                    width: 231,
                    height: 50,
                    colorButton: const Color(0xffFFFFFF),
                    coloBorder: const Color(0xff707070),
                    fontSize: AppSize.s28,
                    colorText: Colors.black,
                    function: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfileScreen()));
                    },
                    text: 'Home'),
                // SizedBox(
                //   height: 50,
                // ),
                // Button(
                //     width: 231,
                //     height: 50,
                //     colorButton: const Color(0xffFFFFFF),
                //     coloBorder: const Color(0xff707070),
                //     fontSize: AppSize.s28,
                //     colorText: Colors.black,
                //     function: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => LoginScreen()));
                //     },
                //     text: TextManager.profileText),
                // SizedBox(
                //   height: 50,
                // ),
                // Button(
                //     width: 231,
                //     height: 50,
                //     colorButton: const Color(0xffFFFFFF),
                //     coloBorder: const Color(0xff707070),
                //     fontSize: AppSize.s28,
                //     colorText: Colors.black,
                //     function: () {
                //       // Navigator.push(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => ProfileScreen()));
                //     },
                //     text: 'About'),
                SizedBox(
                  height: 50,
                ),
                Button(
                    width: 231,
                    height: 50,
                    colorButton: const Color(0xffFFFFFF),
                    coloBorder: const Color(0xff707070),
                    fontSize: AppSize.s28,
                    colorText: Colors.black,
                    function: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfileScreen()));
                    },
                    text: 'Feature'),
                SizedBox(
                  height: 50,
                ),
                Button(
                    width: 231,
                    height: 50,
                    colorButton: const Color(0xffFFFFFF),
                    coloBorder: const Color(0xff707070),
                    fontSize: AppSize.s28,
                    colorText: Colors.black,
                    function: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfileScreen()));
                    },
                    text:'settings'),

              ],
            ),
          ),
          backgroundColor: const Color(0xff00196b),
          body: Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned (
                  left:70 ,

                  top: -130,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE60086),
                    radius: 100,
                  )
              ),
              Positioned (
                  left: -85,
                  top: -80,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE60086),

                    radius: 100,
                  )
              ),
              Positioned (
                  left: -120,
                  top: 80,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE60086),

                    radius: 80,
                  )
              ),
              Positioned (
                  right:70 ,

                  bottom: -130,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff00a8e9),
                    radius: 100,
                  )
              ),
              Positioned (
                  right: -85,
                  bottom: -80,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff00a8e9),

                    radius: 100,
                  )
              ),
              Positioned (
                  right: -120,
                  bottom: 80,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff00a8e9),

                    radius: 80,
                  )
              ),
              Positioned (
                  right: 30,
                  top: 40,
                  child: GestureDetector(
                    onTap: (){
                      _key.currentState?.openDrawer();

                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xff00a8e9),

                      radius: 30,
                      child: Icon(
                        Icons.menu,size: 40,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),


              IconHomePage(width: screenWidth,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenZeroToThree()));
                },
                top: 120,
                right: 30,
                image: AssetsManager.Logo1,
                text: '0-3',
              ),
              IconHomePage(
                width: screenWidth,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThreeToSixScreen()));
                },
                left: 20,
                top: 250,
                text: '3-6',
              ),
              IconHomePage(
                width: screenWidth,
                function: () async {
                  // await cubit.getDoctorInfo();
                  // if(cubit.doctorInfoModel.isNotEmpty){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorInfo()));
                  // }
                },
                right: 30,
                top: 390,
                image: AssetsManager.doctor,
                text: '6-11',

              ),
              IconHomePage(
                width: screenWidth,
                function: () async {
                  {

                  }
                },
                left: 27,
                top: 500,
                image: AssetsManager.medicalHistory,
                text:'11-16',
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
