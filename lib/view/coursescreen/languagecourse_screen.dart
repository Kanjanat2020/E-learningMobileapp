import 'package:animate_do/animate_do.dart';
import 'package:elearning/Provider/course_provider.dart';
import 'package:elearning/constant/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:elearning/widgets/course_container.dart';
import 'package:elearning/view/coursedetail/web/csscourse_screen.dart';
import 'package:shimmer/shimmer.dart';

class LanguagesCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลจาก CourseProvider
    final courseProvider = Provider.of<CourseProvider>(context);
    final languagecourse = courseProvider.courses
        .where((course) => course.courseType == CourseType.Languages)
        .toList(); // กรองคอร์สเฉพาะประเภท Mobile

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "About the course",
          ),
          toolbarHeight: ScreenUtil().setHeight(90),
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: Ink(
              height: ScreenUtil().setHeight(35),
              width: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          color: Color.fromARGB(110, 255, 249, 212),
          child: Stack(
            children: [
              Positioned(
                top: 145, // ระยะจากด้านบน
                right: -10, // ระยะจากด้านขวา
                child: Transform.scale(
                  scale: 1, // ขยายขนาดรูปภาพ
                  child: Image.asset(
                    "assets/images/programming_languages.png",
                    width: 250, // กำหนดความกว้างของรูปภาพ
                    height: 250, // กำหนดความสูงของรูปภาพ
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        ClipPath(
                          clipper: BestSellerClipper(),
                          child: Container(
                            color: kBestSellerColor,
                            padding: EdgeInsets.only(
                                left: 35, top: 5, right: 20, bottom: 5),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade800,
                              highlightColor: Colors.white,
                              child: Text(
                                "BESTSELLER",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        // ดึงข้อมูลชื่อคอร์สจาก provider
                        Text(
                          "Language Development",
                          style: kHeadingTextStyle,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_rounded),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(
                              "120K+",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                            ),
                            Icon(Icons.star_half_rounded),
                            Text(
                              "4.78",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(90)),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeIn(
                                  delay: Duration(milliseconds: 100),
                                  duration: Duration(milliseconds: 500),
                                  child: Text(
                                    "Course Contents",
                                    style: kTitleTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(20),
                                    ),
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: ScreenUtil().setHeight(15),
                                      );
                                    },
                                    itemCount: languagecourse.length,
                                    itemBuilder: (context, index) {
                                      return CourseContainer(
                                        course: languagecourse[index],
                                        goTo: CssCourseDetailsScreen(),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
