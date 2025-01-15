// import 'dart:developer';
//
// import 'package:tally_portal/src/data/repository/firebase/firebase_auth_interface.dart';
//
// import '../../../data/source/remote/firebase/firebase_auth/firebase_app_auth.dart';
// import '../../models/response_model.dart';
//
// class FirebaseAuthImpl implements FirebaseAuthInterface {
//   FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//   @override
//   Future<ResponseModel> createUserFireBase(
//       {required String email,
//       required String password,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppAuth.createUserFireBase(
//           email: email, password: password, username: username);
//       responseModel.isError = false;
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getCurrentUser() async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var userId = await firebaseAppAuth.getCurrentUser();
//       responseModel.isError = false;
//       responseModel.data = userId;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getUsernameExistence(
//       {required String username,
//       required String email,
//       required String password}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       log("ERntering herre === 111");
//
//       var userExists = await firebaseAppAuth.getUsernameExistence(
//           username: username, email: email, password: password);
//       responseModel.isError = false;
//       responseModel.data = userExists;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> signInUserFireBase(
//       {required String email, required String password}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppAuth.signInUserFireBase(
//           email: email, password: password);
//       responseModel.isError = false;
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
// }
