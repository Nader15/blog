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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBftoNurVxDaqK19BJKHcmqaI6zr6zFOD8',
    appId: '1:639254058092:android:8973085fb71527a5523449',
    messagingSenderId: '639254058092',
    projectId: 'portfolio-4e1ea',
    databaseURL: 'https://portfolio-4e1ea.firebaseio.com',
    storageBucket: 'portfolio-4e1ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAjCEeFNjNf-KTIdV8PhshIkiRh58w5iA',
    appId: '1:639254058092:ios:a5e5bb17a2dc8188523449',
    messagingSenderId: '639254058092',
    projectId: 'portfolio-4e1ea',
    databaseURL: 'https://portfolio-4e1ea.firebaseio.com',
    storageBucket: 'portfolio-4e1ea.appspot.com',
    iosClientId: '639254058092-uajnrplf0b8m0l4n9opf3fj4vuk45gff.apps.googleusercontent.com',
    iosBundleId: 'com.nader.blog.blog',
  );
}
