import 'package:elearning/view/mycourses/mycourse_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  int _selectedTag = 0; // 0 = Ongoing, 1 = Completed

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  List<Course> getFilteredCourses() {
    // แยกคอร์สตามเปอร์เซ็นต์การทำเสร็จ
    return mycourses_details.where((course) {
      return _selectedTag == 0
          ? course.completedPercentage < 1.0 // Ongoing
          : course.completedPercentage == 1.0; // Completed
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: ScreenUtil().setHeight(110),
            centerTitle: true,
            title: Text(
              "My Courses",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),
                SizedBox(height: 15.h),
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.h),
                      itemCount: getFilteredCourses().length,
                      itemBuilder: (context, index) {
                        final course = getFilteredCourses()[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50,
                            child: FadeInAnimation(
                              child: CourseListItem(course: course),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabView extends StatelessWidget {
  final int index;
  final Function(int) changeTab;

  const CustomTabView({
    required this.index,
    required this.changeTab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => changeTab(0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: index == 0
                    ? const Color.fromARGB(255, 255, 205, 67)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Ongoing",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight:
                        index == 0 ? FontWeight.bold : FontWeight.normal,
                    color: index == 0 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => changeTab(1),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: index == 1
                    ? const Color.fromARGB(255, 255, 205, 67)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight:
                        index == 1 ? FontWeight.bold : FontWeight.normal,
                    color: index == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CourseListItem extends StatelessWidget {
  final Course course;

  const CourseListItem({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            course.thumbnail,
            width: 50.w,
            height: 50.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Author: ${course.author}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.h),
                // แสดงความคืบหน้าสำหรับคอร์สที่กำลังดำเนินอยู่เท่านั้น
                if (course.completedPercentage < 1.0)
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.grey[300],
                    color: Colors.amber,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
