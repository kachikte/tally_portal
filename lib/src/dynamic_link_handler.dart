// import 'dart:developer';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:tally_portal/src/presentation/controllers/general_controller.dart';
//
// class DynamicLinkHandler {
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//   Future<void> initDynamicLinks() async {
//     log("######################################################");
//     log('Initializing firebase deep link -- ');
//     log("######################################################");
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       // Listen and retrieve dynamic links here
//       final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
//       // Ex: https://namnp.page.link/product/013232
//       log("######################################################");
//       log('Initializing firebase deep link value $deepLink -- ');
//       log("######################################################");
//       final String path = dynamicLinkData.link.path;
//       log("######################################################");
//       log('Initializing firebase deep link path $path -- ');
//       log("######################################################");
//       // Get PATH
//       // Ex: product/013232
//       if(deepLink.isEmpty)  return;
//       handleDeepLink(path);
//     }).onError((error) {
//       print('onLink error');
//       print(error.message);
//     });
//     initUniLinks();
//   }
//   Future<void> initUniLinks() async {
//     try {
//       final initialLink = await dynamicLinks.getInitialLink();
//       if(initialLink == null)  return;
//       handleDeepLink(initialLink.link.path);
//     } catch (e) {
//       // Error
//     }
//   }
//   void handleDeepLink(String path) {
//     List<String>? deepLinkVal = path?.split("_");
//     log('Deep link arr');
//     log('Deep link array -- $deepLinkVal');
//     String? splitLink = deepLinkVal![0];
//     String? splitLinkState = deepLinkVal![1];
//     GeneralController.deepLink = splitLink;
//     // GeneralController.APPINDEX.value = int.parse(splitLinkState);
//     GeneralController.deepLinkScreenState = splitLinkState;
//     // navigate to detailed product screen
//   }
// }