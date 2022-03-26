import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:solutionchallenge/presentation/screen/login%20Screen.dart';
import 'package:solutionchallenge/shared/bloc/AppCupit.dart';
import 'package:solutionchallenge/shared/bloc/AppStates.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../constant/input.dart';
import 'my_home_page.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool click = false;
  var passWordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  String? selectedValue;

  String ? birthDate ;
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    PatternValidator(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$', errorText: 'email must have @ examole Name@gamil.com')
  ]);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
      var  cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff00196b),
            body: buildStack(context ,
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * .13,
                          ),

                          buildTextFormField(
                            validator:RequiredValidator(errorText: 'Enter FirstName Name pleases' ,),
                            controller:firstNameController,
                            labelText: 'First Name',
                            suffixIcon: false,
                            function: (){

                            },
                            iconData: Icons.perm_identity,
                            screenHeight: screenHeight,

                          ),
                          buildTextFormField(
                            validator: RequiredValidator(errorText: 'Enter Last Name pleases' ,) ,
                            controller: lastNameController,
                            labelText: 'Last Name',
                            suffixIcon: false,
                            function: (){

                            },
                            iconData: Icons.perm_identity,
                            screenHeight: screenHeight,

                          ),
                          buildTextFormField(
                            validator: emailValidator,
                            controller:emailController,
                            labelText: 'Email',
                            suffixIcon: false,
                            function: (){

                            },
                            iconData: Icons.email,
                            screenHeight: screenHeight,

                          ),
                          buildTextFormField(
                              screenHeight: screenHeight,
                              validator: passwordValidator,
                              controller: passWordController,
                              labelText: 'password',
                              suffixIcon: true,
                              iconData: Icons.lock,
                              click: click,
                              function: (){
                                setState(() {
                                  click =!click;
                                });
                                print(click);
                              }
                          ),
                          DropdownButtonFormField2(
                            iconEnabledColor: Colors.yellow,
                            iconDisabledColor: Colors.grey,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(


                              isDense: true,
                              contentPadding: EdgeInsets.zero,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            isExpanded: true,

                            hint: const Text(
                              'Select Your Gender',
                              style: TextStyle(fontSize: 14 , color: Colors.black),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            items: genderItems
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value.toString();

                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                selectedValue = value.toString();
                              });

                            },
                          ),
                          Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                                  child: InkWell(
                                    onTap: () async{
                                      await showDatePicker(context: context,
                                          initialDate: DateTime.now(), lastDate: DateTime.now(),
                                          firstDate: DateTime((1920))

                                      ).then((value)  {
                                        var x =  DateFormat.yMd('en_US').format(value!).toString();
                                        setState(() {
                                          birthDate = x ;
                                        });
                                      });
                                    },
                                    child: Container(
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          birthDate ??"Enter birth DAte" ,style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold

                                        ),
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),


                          Button(
                            height: screenHeight * .07,
                            width: screenWidth * .5,
                            text: "sign in",
                            function: () {
                              if(formKey.currentState!.validate() &&birthDate !=null){
                                cubit.registration(
                                  lastName: lastNameController.text,
                                  password: passWordController.text,
                                  emailAddress: emailController.text,
                                  gender: selectedValue,
                                  dateTime: birthDate,
                                  firstName: firstNameController.text,

                                ).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                    MyHomePage()
                                )));
                               




                              }
                            },
                            fontSize: 30,
                            coloBorder: Colors.grey,
                            colorButton: Colors.white,
                            colorText: Colors.black,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already Have Account ? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const LoginScreen()));
                                  },
                                  child: const Text('Login Now' ,style: TextStyle(
                                    color: Colors.pink
                                  ),))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ),
          ),
        );
      },
    );
  }




}
