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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBEA16tMyUcQcs6kG-R1JWSRgvenWIHX3E',
    appId: '1:627115676913:web:b6dde0718c2bb2b05a0550',
    messagingSenderId: '627115676913',
    projectId: 'plantcareapp-56b51',
    authDomain: 'plantcareapp-56b51.firebaseapp.com',
    storageBucket: 'plantcareapp-56b51.appspot.com',
    measurementId: 'G-C18PFSVCFY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIcB9jP400k0za9Oyrz2hPJxc9szIdb-k',
    appId: '1:627115676913:android:57b02369d3665a565a0550',
    messagingSenderId: '627115676913',
    projectId: 'plantcareapp-56b51',
    storageBucket: 'plantcareapp-56b51.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsldzsZX4w3JyB4Oys0jhvSaIUV87iwnE',
    appId: '1:627115676913:ios:5938adf79a7fd6e05a0550',
    messagingSenderId: '627115676913',
    projectId: 'plantcareapp-56b51',
    storageBucket: 'plantcareapp-56b51.appspot.com',
    iosClientId: '627115676913-sa96q6o8dle4tb4lqcu6o2hvn7067kls.apps.googleusercontent.com',
    iosBundleId: 'com.example.appios',
  );
}
