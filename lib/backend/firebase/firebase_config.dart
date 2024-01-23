import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC6ssaliqICVXyyeAP_5kmY0naYAjIg0h4",
            authDomain: "eve-dfd9d.firebaseapp.com",
            projectId: "eve-dfd9d",
            storageBucket: "eve-dfd9d.appspot.com",
            messagingSenderId: "964474770698",
            appId: "1:964474770698:web:6b19a9f3c3ecb554b616f3",
            measurementId: "G-DQFK779V6S"));
  } else {
    await Firebase.initializeApp();
  }
}
