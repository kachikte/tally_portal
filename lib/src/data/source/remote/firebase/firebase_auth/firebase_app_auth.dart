// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';
//
// import '../firebase_resource/firebase_app_resource.dart';
//
// class FirebaseAppAuth {
//
//   final firebaseAuth = FirebaseAuth.instance;
//   final fireStore = FirebaseFirestore.instance;
//
//   getCurrentUser() async {
//     var userId = firebaseAuth.currentUser?.uid;
//     return userId;
//   }
//
//   getUsernameExistence({required String username,
//     required String email,
//     required String password}) async {
//     bool res = await
//     fireStore.collection('users')
//         .where('username', whereIn: [username])
//         .get()
//         .then((value) {
//       if (value.docs.isEmpty) {
//
//         log("ERntering herre === 222");
//
//         createUserFireBase(
//             email: email, password: password, username: username);
//       } else {
//
//         log("ERntering herre === 333");
//
//         signInUserFireBase(
//             email: email, password: password);
//       }
//
//       return value.docs.isEmpty;
//
//     });
//
//     return res;
//   }
//
//   createUserFireBase({required String email, required String password, required String username}) async {
//
//     FirebaseAppResource firebaseAppResource = FirebaseAppResource();
//
//     String userId = const Uuid().v4();
//     final auth = FirebaseAuth.instance;
//
//     var user;
//     bool alreadyExists = false;
//
//     try {
//       user = await auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       print("this is the other user error === ${e.toString()}");
//       print("is true ? === ${e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account."}");
//       alreadyExists = e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account.";
//     }
//
//     var token = (await firebaseAppResource.getNotificationToken())!;
//
//     if (alreadyExists == true) {
//       print("it does ooo == ");
//     }
//     await fireStore.collection('users').doc(alreadyExists ? FirebaseAuth.instance.currentUser?.uid : user.user?.uid).set({
//       "userId": userId,
//       "username": username,
//       "email": email,
//       "password": password,
//       "role": "user",
//       "dateAdded": DateTime.now(),
//       'updatedAt': DateTime.now(),
//       'imageUrl': '',
//       'uniqueKey': '',
//       "notification_token": token
//     });
//   }
//
//   signInUserFireBase({required String email, required String password}) async {
//     FirebaseAppResource firebaseAppResource = FirebaseAppResource();
//     final auth = FirebaseAuth.instance;
//     await auth.signInWithEmailAndPassword(email: email, password: password);
//     var token =  await firebaseAppResource.getNotificationToken();
//     firebaseAppResource.updateNotificationToken(token: token);
//   }
//
// }