import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:solutionchallenge/constant/input.dart';
import 'package:solutionchallenge/presentation/resources/assets/assetclass.dart';
import 'package:solutionchallenge/presentation/resources/text_manager.dart';
import 'package:solutionchallenge/presentation/resources/value_manager.dart';
import 'package:solutionchallenge/presentation/screen/my_home_page.dart';
import 'package:solutionchallenge/presentation/screen/registerScreen.dart';
import 'package:solutionchallenge/shared/bloc/AppCupit.dart';

import '../../shared/bloc/AppStates.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
bool  click = true;
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
]);
class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController();
  var emailWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {

    },
      builder: (context, state) {
      var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff00196b),



            body: buildStack(context,
                Align(
                alignment: Alignment.center,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 370,
              height: 270,

              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [

                      TextFormField(
                        controller: emailWordController,
                        validator: EmailValidator(
                            errorText: 'enter a valid email address'),
                        decoration: InputDecoration(
                          label: Text(
                              "User name"
                          ),
                          filled: true,
                          focusColor: Colors.black,
                          fillColor: Colors.white,


                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(

                                  color: Colors.white,
                                  width: 2
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .04,
                      ),
                      TextFormField(
                        validator: passwordValidator,
                        obscureText: click,
                        controller: passWordController,

                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: (click)
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                click = !click;
                              });
                            },
                          ),
                          label: Text(
                              "Password"
                          ),
                          filled: true,
                          focusColor: Colors.black,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2
                              )


                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      Button(
                        height: screenHeight * .07,
                        width: screenWidth * .5,
                        text: "sign in",
                        function: () {
                          cubit.login(emailAddress: emailWordController.text , password: passWordController.text).then((value) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                            MyHomePage()
                            ));
                          });
                        },
                        fontSize: 30,
                        coloBorder: Colors.grey,
                        colorButton: Colors.white,
                        colorText: Colors.black,
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("if you don`t have account ? ",
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          TextButton(onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    RegisterScreen()
                                ));
                          }, child: Text(
                              'register here'
                          ))
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
            )

          ),
        );
      },
    );
  }
}
