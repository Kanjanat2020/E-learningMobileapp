import 'package:flutter/material.dart';
import 'package:elearning/view/profile/constants.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap; // รองรับ onTap callback

  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap, // เพิ่ม onTap ใน constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( // ใช้ InkWell เพื่อให้รองรับการกด
      onTap: onTap, // เมื่อกดจะเรียกฟังก์ชัน onTap
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Constants.blackColor.withOpacity(.5),
                  size: 24.0,
                ),
                const SizedBox(width: 16.0),
                Text(
                  title,
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Constants.blackColor.withOpacity(.4),
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
