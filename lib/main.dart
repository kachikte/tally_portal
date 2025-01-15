import 'dart:async';
import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/init_controllers.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/utils/utils.dart';
import 'package:uni_links/uni_links.dart';
import 'package:upgrader/upgrader.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// Future<dynamic> myBackgroundMessageHandler(RemoteMessage remoteMessage) async {
//   log("onbackground === ${remoteMessage.notification?.title} ${remoteMessage.notification?.body}");
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Upgrader.clearSavedSettings();
  // final RemoteMessage? remoteMessage =
  // await FirebaseMessaging.instance.getInitialMessage();
  // if (remoteMessage != null) {
  //   print(
  //       "===this is the remote message ${remoteMessage.notification.toString()}");
  // }
  // await HelperNotification.initialize(flutterLocalNotificationsPlugin);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  GeneralController.initialToken =
  await SecuredStorage.readData(key: StoredKeys.TOKEN);
  log('This is the token that exists or not --- ${GeneralController.initialToken}');
  // DynamicLinkHandler dynamicLinkHandler = DynamicLinkHandler();
  // await dynamicLinkHandler.initDynamicLinks();
  // await initUniLinks();
  runApp(const MyApp());
}

Future<void> initUniLinks() async {
  try {
    log("===================================================");
    log('Initializing deep link -- ');
    log("===================================================");
    String? initialLink = await getInitialLink();
    String? splitLink = initialLink?.split("legendpay.ng")[1];
    log("===================================================");
    log('This is the deep link -  $splitLink');
    log("===================================================");
    if (splitLink != null) {
      log("===================================================");
      log('About to deep login');
      log("===================================================");
      GeneralController.deepLink = splitLink;
      // Get.offAndToNamed(AppRoutes.login);
      // handleLink(splitLink);
      // log('About to deep login now');
    }
  } catch (e) {
    log('Error initializing deep link: $e');
  }

  // Listen for incoming links while the app is running
  linkStream.listen((String? link) {
    log('Streaming deep link -- ');
    log('This is the streamed deep link -  $link');
    String? splitLink = link?.split("legendpay.ng")[1];
    // log('Split received link: $splitLink');
    // splitLink = (splitLink != "/login-screen") && (GeneralController.initialToken == null) ? "/login-screen" : splitLink;
    // handleLink(splitLink);
    GeneralController.deepLink = splitLink;
  }, onError: (err) {
    // Handle error receiving link
  });
}

void handleLink(String? link) async {
  if (link != null) {
    // Handle the incoming link and navigate to the appropriate part of the app
    // LoginController loginController = Get.put(LoginController());
    log('About to deep login aa');
    // await loginController.deepLinkLogin(Get.context!);
    log('after to deep login');
    log('Received link: $link');

    // Example: Use Navigator to navigate based on the link
    // Navigator.pushNamed(context, splitLink);
    Get.offAndToNamed(link);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // late IO.Socket socket;
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    getDeviceId();
    // log('About to connect to socket');
    // initializeSocket();
    // log('Connected to socket');
  }

  Future<void> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String id;

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        id = androidInfo.id; // Unique device ID
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        id = iosInfo.identifierForVendor ?? "Unknown"; // Unique device ID
      } else {
        id = "Unsupported Platform";
      }
    } catch (e) {
      id = "Error: ${e.toString()}";
    }

    Constants.deviceId = id;

    // setState(() {
    //   deviceId = id;
    // });
  }

  // void initializeSocket() {
  //   socket = IO.io(ApiUrls.baseUrlTest, <String, dynamic>{
  //     'transports': ['websocket'],
  //     'autoConnect': true,
  //   });
  //
  //   socket.onConnect((_) {
  //     log('Connected to server');
  //
  //     // Register user ID (replace '12345' with dynamic user ID)
  //     socket.emit('register', '12345');
  //   });
  //
  //   socket.on('message', (data) {
  //     log('New message: $data');
  //     setState(() {
  //       messages.add(data);
  //     });
  //     // UtilFunctions.showTopSnackSuccess(context, data);
  //     Get.snackbar(data, data);
  //   });
  //
  //   socket.onDisconnect((_) {
  //     log('Disconnected from server');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    InitControllers();
    return GlobalLoaderOverlay(
      overlayColor: Colors.transparent,
      child: OverlaySupport(
          child: UpgradeAlert(
            child: GetMaterialApp(
              initialRoute: AppRoutes.login,
              title: AppConstants.TITLE,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: AppTheme.themeMode(isLight: true),
              getPages: AppRoutes.routes(),
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                // FirebaseAnalyticsObserver(analytics: MyAnalytics.firebaseAnalytics),
              ],
            ),
          )),
    );
  }
}
