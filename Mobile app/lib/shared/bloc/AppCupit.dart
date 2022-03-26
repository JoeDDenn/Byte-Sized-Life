import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionchallenge/constant/model/createUserModel.dart';
import 'AppStates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  UserInfoData ? userInfo ;
  Future<void> registration(
      {String? emailAddress,
      String? password,
      String? firstName,
      String? lastName,
      String? loginID,
      String? dateTime,
      String? gender}) async {

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailAddress!, password: password!)
        .then((value) {
      emit(CreateUserDone());
      userInfo = UserInfoData(
          firstName: firstName!,
          lastName: lastName!,
          dateTime: dateTime,
          emailAddress: emailAddress,
          gender: gender);
      FirebaseFirestore.instance.collection('user').add(userInfo!.toMap());

    });
  }
  UserInfoData ? userInfoGet;
  Future<void> login(
      { required String? emailAddress,
        required String? password,
        }) async {

   // await FirebaseAuth.instance.signInWithEmailAndPassword(
   //      email: emailAddress!, password: password!
   //  )
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!
    )

        .then((value) {

      print(  value.user!.uid);
      print(  value.user!.refreshToken);
      FirebaseFirestore.instance.collection('user').doc(  value.user!.uid).get(

      ).then((value) {
        userInfoGet = UserInfoData.fromJson(value.data()!);
      }).catchError((e){print(e.toString());});
    });
  }

}
