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
    apiKey: 'AIzaSyBy5H77y4OjAH9davqk-FFuWi7pAkJvqPg',
    appId: '1:540027399853:web:fea87796dfa1b540132024',
    messagingSenderId: '540027399853',
    projectId: 'farmer22for',
    authDomain: 'farmer22for.firebaseapp.com',
    storageBucket: 'farmer22for.appspot.com',
    measurementId: 'G-CYQ3BBQJKW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9-IFa9ek6I9YaKsjZU3x4GBz2pg2pYo0',
    appId: '1:540027399853:android:82b3c5748b371e73132024',
    messagingSenderId: '540027399853',
    projectId: 'farmer22for',
    storageBucket: 'farmer22for.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJK-WtVvGyAiFBEBgnq37RcsanhFMyayE',
    appId: '1:540027399853:ios:b4a4617eac97ef5b132024',
    messagingSenderId: '540027399853',
    projectId: 'farmer22for',
    storageBucket: 'farmer22for.appspot.com',
    iosBundleId: 'com.example.farmer22for',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJK-WtVvGyAiFBEBgnq37RcsanhFMyayE',
    appId: '1:540027399853:ios:b4a4617eac97ef5b132024',
    messagingSenderId: '540027399853',
    projectId: 'farmer22for',
    storageBucket: 'farmer22for.appspot.com',
    iosBundleId: 'com.example.farmer22for',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBy5H77y4OjAH9davqk-FFuWi7pAkJvqPg',
    appId: '1:540027399853:web:4e8bda759f94f1c0132024',
    messagingSenderId: '540027399853',
    projectId: 'farmer22for',
    authDomain: 'farmer22for.firebaseapp.com',
    storageBucket: 'farmer22for.appspot.com',
    measurementId: 'G-8C60NQYW4Z',
  );
}
