import 'package:animations/animations.dart';
import 'package:elearning/constant/color_pallete.dart';
import 'package:elearning/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Widget goTo;

  const CategoryCard({super.key, required this.category, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      openElevation: 4,
      closedBuilder: (context, action) => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(112, 255, 249, 212),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 0.05,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 75.h, // ปรับตำแหน่งภาพด้านบน
              right: -15.w, // ปรับตำแหน่งภาพด้านขวา
              child: Image.asset(
                category.thumbnail,
                height: 150.h, // กำหนดขนาดภาพ
                width: 150.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 5.h), // เพิ่มช่องว่างระหว่าง Text
                  Text(
                    "${category.noOfCourses.toString()} courses",
                    style: TextStyle(
                      color: kTextColor.withOpacity(0.8),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      openBuilder: (context, action) {
        return goTo;
      },
    );
  }
}
