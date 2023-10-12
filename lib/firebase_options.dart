// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCxh_t4Q6l3-1udu7k25gx1NMnQPnE-4Go',
    appId: '1:73284443025:web:da24b4f999a6ae537f1830',
    messagingSenderId: '73284443025',
    projectId: 'tesla-1657f',
    authDomain: 'tesla-1657f.firebaseapp.com',
    databaseURL: 'https://tesla-1657f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tesla-1657f.appspot.com',
    measurementId: 'G-4436B5G8NN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGdjA-ytBpNXFsBnCeymESmAFyJW4PjGU',
    appId: '1:73284443025:android:a6e67b913d02f5957f1830',
    messagingSenderId: '73284443025',
    projectId: 'tesla-1657f',
    databaseURL: 'https://tesla-1657f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tesla-1657f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6h9uabInHy-S7Y6FZIEy2A4cXSxmi5cw',
    appId: '1:73284443025:ios:39dcf3fc1b07d3477f1830',
    messagingSenderId: '73284443025',
    projectId: 'tesla-1657f',
    databaseURL: 'https://tesla-1657f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tesla-1657f.appspot.com',
    iosBundleId: 'com.example.tesla',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6h9uabInHy-S7Y6FZIEy2A4cXSxmi5cw',
    appId: '1:73284443025:ios:d46310e9c9a6d2d97f1830',
    messagingSenderId: '73284443025',
    projectId: 'tesla-1657f',
    databaseURL: 'https://tesla-1657f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tesla-1657f.appspot.com',
    iosBundleId: 'com.example.tesla.RunnerTests',
  );
}
