// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCIMoDqVjgU0W3uUwR2btStA6Rz-Xb4b5k',
    appId: '1:977817813504:web:83dae099b101e7e33ecee5',
    messagingSenderId: '977817813504',
    projectId: 'ecommerce-d5623',
    authDomain: 'ecommerce-d5623.firebaseapp.com',
    storageBucket: 'ecommerce-d5623.appspot.com',
    measurementId: 'G-74VCXGTV52',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVhYBiow1X239egCxSdDn6TGhrT7DTcF4',
    appId: '1:977817813504:android:a539e71dee9e780d3ecee5',
    messagingSenderId: '977817813504',
    projectId: 'ecommerce-d5623',
    storageBucket: 'ecommerce-d5623.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAs3fIcUP8uOXkAR5aUsCZK8CdFdS_k9y0',
    appId: '1:977817813504:ios:835e1aad56d23ab63ecee5',
    messagingSenderId: '977817813504',
    projectId: 'ecommerce-d5623',
    storageBucket: 'ecommerce-d5623.appspot.com',
    iosBundleId: 'com.example.adminFujikaEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAs3fIcUP8uOXkAR5aUsCZK8CdFdS_k9y0',
    appId: '1:977817813504:ios:835e1aad56d23ab63ecee5',
    messagingSenderId: '977817813504',
    projectId: 'ecommerce-d5623',
    storageBucket: 'ecommerce-d5623.appspot.com',
    iosBundleId: 'com.example.adminFujikaEcommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCIMoDqVjgU0W3uUwR2btStA6Rz-Xb4b5k',
    appId: '1:977817813504:web:1510b4df5c81309e3ecee5',
    messagingSenderId: '977817813504',
    projectId: 'ecommerce-d5623',
    authDomain: 'ecommerce-d5623.firebaseapp.com',
    storageBucket: 'ecommerce-d5623.appspot.com',
    measurementId: 'G-4JSHHDCHN0',
  );
}
