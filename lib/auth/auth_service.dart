import 'package:elearning/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle(BuildContext context) async {
    try {
      // ทำการ sign out ก่อน เพื่อให้ผู้ใช้สามารถเลือกบัญชีใหม่ได้
      await GoogleSignIn().signOut();

      // เริ่มการเข้าสู่ระบบใหม่
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(cred);

      // หากการเข้าสู่ระบบสำเร็จ, นำทางไปที่หน้า MainScreen
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        // บันทึกข้อมูลผู้ใช้ลงใน Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'displayName': userCredential.user?.displayName,
          'email': userCredential.user?.email,
          'profileImageUrl': userCredential.user?.photoURL,
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }

      return userCredential;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
