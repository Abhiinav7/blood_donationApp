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
    apiKey: 'AIzaSyD2gK3exQuTm9CarnAMavJ5ra-rKb6EEpQ',
    appId: '1:511038084290:web:8953c2114bdd410738d75b',
    messagingSenderId: '511038084290',
    projectId: 'blooddonation-33c6a',
    authDomain: 'blooddonation-33c6a.firebaseapp.com',
    storageBucket: 'blooddonation-33c6a.appspot.com',
    measurementId: 'G-Z2B6S0KMN9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFY7vov5QvdjziTg3TdkmrIZsx-BBftuw',
    appId: '1:511038084290:android:12c17e5ca809919f38d75b',
    messagingSenderId: '511038084290',
    projectId: 'blooddonation-33c6a',
    storageBucket: 'blooddonation-33c6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDUcJHGzfk7LwYwWgDuocdu01JHcJOd8w',
    appId: '1:511038084290:ios:268b5c11674a1d7f38d75b',
    messagingSenderId: '511038084290',
    projectId: 'blooddonation-33c6a',
    storageBucket: 'blooddonation-33c6a.appspot.com',
    iosBundleId: 'com.example.bloodDonationApp',
  );
}
