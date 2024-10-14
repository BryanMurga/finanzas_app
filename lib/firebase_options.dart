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
    apiKey: 'AIzaSyBMWi8PGaT5yDL_9NAJ8lQV_A9znEz43VM',
    appId: '1:126279978788:web:d82e88f46e2d5b4507edb1',
    messagingSenderId: '126279978788',
    projectId: 'restaurantec-47f78',
    authDomain: 'restaurantec-47f78.firebaseapp.com',
    storageBucket: 'restaurantec-47f78.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTfjoYLO1WkIMd7YHhGrsEV_heF14q3pk',
    appId: '1:126279978788:android:a1d56bc5bea8be1407edb1',
    messagingSenderId: '126279978788',
    projectId: 'restaurantec-47f78',
    storageBucket: 'restaurantec-47f78.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP6p3a7-bj_6ajVZGCdOWWtN9Nnmq3OdA',
    appId: '1:126279978788:ios:57cf4f252a4f307307edb1',
    messagingSenderId: '126279978788',
    projectId: 'restaurantec-47f78',
    storageBucket: 'restaurantec-47f78.appspot.com',
    iosBundleId: 'com.example.finanzasApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP6p3a7-bj_6ajVZGCdOWWtN9Nnmq3OdA',
    appId: '1:126279978788:ios:57cf4f252a4f307307edb1',
    messagingSenderId: '126279978788',
    projectId: 'restaurantec-47f78',
    storageBucket: 'restaurantec-47f78.appspot.com',
    iosBundleId: 'com.example.finanzasApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMWi8PGaT5yDL_9NAJ8lQV_A9znEz43VM',
    appId: '1:126279978788:web:3f88f3eab32a6f1707edb1',
    messagingSenderId: '126279978788',
    projectId: 'restaurantec-47f78',
    authDomain: 'restaurantec-47f78.firebaseapp.com',
    storageBucket: 'restaurantec-47f78.appspot.com',
  );
}
