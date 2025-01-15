// import 'package:tally_portal/src/data/repository/firebase/firebase_analytics_interface.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/analytics/tally_analytics.dart';
// import 'package:tally_portal/src/domain/domain.dart';
//
// class FirebaseAnalyticsImpl implements FirebaseAnalyticsInterface {
//   TallyAnalytics tallyAnalytics = TallyAnalytics();
//
//   @override
//   Future<ResponseModel> addAppOpenAnalytics() async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addAppOpenAnalytics();
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addBillingTicketAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addBillingTicketAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addCallsInitiatedAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addCallsInitiatedAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addChatsInitiatedAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addChatsInitiatedAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addLoginAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addLoginAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addLogoutAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addLogoutAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> addSupportTicketAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.addSupportTicketAnalytics(
//           firstName: firstName, lastName: lastName, username: username);
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> randomLogAnalytics() async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       await tallyAnalytics.randomLogAnalytics();
//       responseModel.isError = false;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
// }
