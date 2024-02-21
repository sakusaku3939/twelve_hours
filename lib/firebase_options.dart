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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDBxc7okEqf6FYuAdglXzEMJpSohF1ehig',
    appId: '1:242778632070:web:a67d6e96f3edb1e55e0607',
    messagingSenderId: '242778632070',
    projectId: 'hours-929ea',
    authDomain: 'hours-929ea.firebaseapp.com',
    databaseURL: 'https://hours-929ea-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hours-929ea.appspot.com',
    measurementId: 'G-177HMH7TXX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCX9V5SPdSZz1rF8LzCkgoEVxfOqayh7OE',
    appId: '1:242778632070:android:c2a4282640db2b5a5e0607',
    messagingSenderId: '242778632070',
    projectId: 'hours-929ea',
    databaseURL: 'https://hours-929ea-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hours-929ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwZ6Lq0wtkiYs5Lbn9O_eNfHFIKkL9MK4',
    appId: '1:242778632070:ios:a6fe581424a7313a5e0607',
    messagingSenderId: '242778632070',
    projectId: 'hours-929ea',
    databaseURL: 'https://hours-929ea-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hours-929ea.appspot.com',
    iosBundleId: 'com.example.twelveHours',
  );
}
