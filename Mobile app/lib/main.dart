import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionchallenge/main.dart';
import 'package:solutionchallenge/presentation/screen/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:solutionchallenge/presentation/screen/my_home_page.dart';
import 'package:solutionchallenge/shared/bloc/AppCupit.dart';
import 'package:solutionchallenge/shared/bloc/AppStates.dart';
import 'package:solutionchallenge/shared/bloc/BlocObserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {

        },
        builder: (context ,state){
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const OnBoardingScreen()
          );
      }

      )
    );
  }
}


