// import 'my_analytics.dart';
//
// class TallyAnalytics {
//   addAppOpenAnalytics() async {
//     await MyAnalytics.firebaseAnalytics.logAppOpen();
//   }
//
//   addLoginAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(name: 'login', parameters: {
//       "first_name": firstName,
//       "last_name": lastName,
//       "user_name": username
//     });
//   }
//
//   addLogoutAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(name: 'logout', parameters: {
//       "first_name": firstName,
//       "last_name": lastName,
//       "user_name": username
//     });
//   }
//
//   addSupportTicketAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(
//         name: 'support_tickets_added',
//         parameters: {
//           "first_name": firstName,
//           "last_name": lastName,
//           "user_name": username
//         });
//   }
//
//   addBillingTicketAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(
//         name: 'billing_tickets_added',
//         parameters: {
//           "first_name": firstName,
//           "last_name": lastName,
//           "user_name": username
//         });
//   }
//
//   addCallsInitiatedAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(
//         name: 'calls_initiated',
//         parameters: {
//           "first_name": firstName,
//           "last_name": lastName,
//           "user_name": username
//         });
//   }
//
//   addChatsInitiatedAnalytics(
//       {required String firstName,
//       required String lastName,
//       required String username}) async {
//     await MyAnalytics.firebaseAnalytics.logEvent(
//         name: 'chats_initiated',
//         parameters: {
//           "first_name": firstName,
//           "last_name": lastName,
//           "user_name": username
//         });
//   }
//
//   randomLogAnalytics() async {
//     await MyAnalytics.firebaseAnalytics
//         .logEvent(name: 'random', parameters: {'new_value': "abc"});
//   }
// }
