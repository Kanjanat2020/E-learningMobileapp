import 'package:elearning/auth/login.dart';
import 'package:elearning/view/profile/profile_widget.dart';
import 'package:elearning/view/profile/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? displayName;
  String? email;
  String? profileImageUrl;
  bool isGoogleLogin = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        isGoogleLogin = user.providerData.any((info) => info.providerId == 'google.com');

        if (isGoogleLogin) {
          DocumentSnapshot userData = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

          if (userData.exists) {
            setState(() {
              displayName = userData['displayName'];
              email = user.email;
              profileImageUrl = userData['profileImageUrl'];
              isLoading = false;
            });
          }
        } else {
          setState(() {
            email = user.email;
            displayName = null;
            profileImageUrl = null;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          displayName = 'ไม่ได้ล็อกอิน';
          email = 'ไม่มีอีเมล';
          profileImageUrl = null;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
        displayName = 'เกิดข้อผิดพลาด';
        email = 'ไม่สามารถดึงข้อมูล';
        profileImageUrl = null;
      });
    }
  }

  Future<void> _logout() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      print("Logout Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: ScreenUtil().setHeight(110), // ไม่เปลี่ยนความสูงของ AppBar
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -30), // เลื่อนรูปภาพขึ้นไป 30 พิกเซล
                      child: Container(
                        width: 150,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          backgroundImage: profileImageUrl != null
                              ? NetworkImage(profileImageUrl!)
                              : const AssetImage('assets/images/profile.jpg') as ImageProvider,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Constants.primaryColor.withOpacity(.5),
                            width: 5.0,
                          ),
                        ),
                      ),
                    ),
                    if (isGoogleLogin && displayName != null)
                      SizedBox(
                        width: size.width * .6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                displayName!,
                                style: TextStyle(
                                  color: Constants.blackColor,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Image.asset("assets/images/verified.png"),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 5), // ลดระยะห่างระหว่างชื่อกับอีเมล
                    Text(
                      email ?? 'ไม่สามารถดึงอีเมล',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(.3),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      height: size.height * 0.5,
                      child: ListView(
                        children: [
                          const ProfileWidget(icon: Icons.person, title: 'My Profile'),
                          const ProfileWidget(icon: Icons.settings, title: 'Settings'),
                          const ProfileWidget(icon: Icons.notifications, title: 'Notifications'),
                          const ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                          const ProfileWidget(icon: Icons.share, title: 'Share'),
                          ProfileWidget(
                            icon: Icons.logout,
                            title: 'Log Out',
                            onTap: _logout,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
