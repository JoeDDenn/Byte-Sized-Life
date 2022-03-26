import 'package:flutter/material.dart';
import 'package:solutionchallenge/presentation/screen/screenVideo.dart';

import '../../constant/input.dart';
import 'WebView.dart';
class ThreeToSixScreen extends StatefulWidget {
  const ThreeToSixScreen({Key? key}) : super(key: key);

  @override
  State<ThreeToSixScreen> createState() => _ThreeToSixScreenState();
}
List<Paint> paints = <Paint>[
  Paint(1, 'Pointing at a place that is permissible to touch on your child s body and asking him whether this is normal or not?', Colors.red),
  Paint(2, 'Ask your child to draw certain shapes dictated to him to see how well he understands the shapes', Colors.blue),
  Paint(3, 'play with him and ask him about his private places in his body ', Colors.green),
  Paint(4, 'Make questioning and mutual respect for privacy a part of their lives, and ask their permission before approaching them', Colors.lime),

];

class _ThreeToSixScreenState extends State<ThreeToSixScreen> {
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
            SizedBox(
              height: 115,
            ),
        Expanded(
          child: ListView(
          children: List.generate(paints.length, (index) {
            return ListTile(
              onTap: () {
                setState(() {
                  paints[index].selected = !paints[index].selected;

                });
              },
              selected: paints[index].selected,
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: paints[index].colorpicture,
                  ),
                ),
              ),
              title: Text('Q ' + paints[index].id.toString() ,style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
              subtitle: Text(paints[index].title ,style: TextStyle(
                  color: Colors.white,fontSize: 20
              ),),
              trailing: (paints[index].selected)
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
            );
          }),
      ),
        ),

          ],
        ),

      )),
    );
  }
}
class Paint {
  final int id;
  final String title;
  final Color colorpicture;
  bool selected = false;

  Paint(this.id, this.title, this.colorpicture);
}
