import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Button extends StatelessWidget {
  Function ? function;
  String ? text ;
  double ? width;
  double ? height;
  Color ? colorButton;
  double ? fontSize;
  Color ? colorText;
  Color ? coloBorder;
  Button({this.function , this.text , this.height , this.width ,this.colorButton , this.fontSize ,  this.colorText , this.coloBorder} );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function!();
      },
      child:  Text(text!, style: TextStyle(
        color: colorText,
        fontSize: fontSize ,
      ),),
      style: ElevatedButton.styleFrom(
          primary: colorButton,
          fixedSize:  Size(width!, height!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50) , ) ,side: BorderSide(
          color: coloBorder!
      ) ),
    );
  }
}
class IconHomePage extends StatelessWidget {
  double ? right;
  double ? top;
  double ? left;
  String ?image;
  String ? text;
  Function ? function;
  double ?width;
  IconHomePage({this.left, this.right ,this.top , this.image ,this.text , required this.function ,this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      left: left,
      child: Container(
        width: width!*0.4,

        child: GestureDetector(
          onTap: (){
            function!();
          },
          child: Column(
            children:   [

              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius:30,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ]
                ),
                child: CircleAvatar(
                  radius: 80,

                  backgroundColor: Color(0xffffffff).withOpacity(0.76),
                  child: Text(text!, style:TextStyle(fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.start ,maxLines: 1 ,),
                ),
              ),
              SizedBox(
                height: 20,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
Column buildTextFormField({

  required bool suffixIcon,
  required String labelText,
  required var controller,
  required  FieldValidator validator,
    bool ? click,
  required Function function,
  required screenHeight,
  required IconData iconData,

}) {

  return Column(
    children: [
      TextFormField(
        validator: validator,
        controller: controller,
        obscureText: click??false,
        decoration: InputDecoration(

          suffixIcon: (suffixIcon)? IconButton(
            icon: (click!)
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            onPressed: () {
              function();
            },
          ) : SizedBox(),
          hintText: labelText,
          prefixIcon: Icon(
              iconData ,
            color: Color(0xffE60086),

          ),
          filled: true,
          focusColor: Colors.black,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.white, width: 2)),
        ),
      ),
      SizedBox(
        height: screenHeight * .04,
      ),
    ],
  );
}
Stack buildStack(BuildContext context , Widget widget  ) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      const Positioned(
          left: 70,
          top: -130,
          child: CircleAvatar(
            backgroundColor: Color(0xffE60086),
            radius: 100,
          )),
      const Positioned(
          left: -85,
          top: -80,
          child: CircleAvatar(
            backgroundColor: Color(0xffE60086),
            radius: 100,
          )),
      const Positioned(
          left: -120,
          top: 80,
          child: CircleAvatar(
            backgroundColor: Color(0xffE60086),
            radius: 80,
          )),
      const Positioned(
          right: 70,
          bottom: -130,
          child: CircleAvatar(
            backgroundColor: Color(0xff00a8e9),
            radius: 100,
          )),
      const Positioned(
          right: -85,
          bottom: -80,
          child: CircleAvatar(
            backgroundColor: Color(0xff00a8e9),
            radius: 100,
          )),
      const Positioned(
          right: -120,
          bottom: 80,
          child: CircleAvatar(
            backgroundColor: Color(0xff00a8e9),
            radius: 80,
          )),

      const Positioned(
          right: 70,
          bottom: -130,
          child: CircleAvatar(
            backgroundColor: Color(0xff00a8e9),
            radius: 100,
          )),
      widget,



    ],
  );
}