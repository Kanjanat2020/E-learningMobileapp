import 'package:elearning/Provider/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:elearning/widgets/course_container.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    // ดึงคอร์สที่ถูกทำเครื่องหมายว่าเป็นรายการโปรด
    List<Course> favoriteCourses =
        courseProvider.courses.where((course) => course.isfavorited).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: ScreenUtil().setHeight(110),
        centerTitle: true,
        title: Text(
          "My Favorite",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: favoriteCourses.isEmpty
          ? Center(child: Text('You have no favorite courses.'))
          : Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
                itemCount: favoriteCourses.length,
                itemBuilder: (context, index) {
                  return CourseContainer(
                    course: favoriteCourses[index],
                    goTo: Container(), // กำหนดหน้าที่จะไปเมื่อคลิกคอร์ส
                  );
                },
              ),
          ),
    );
  }
}
