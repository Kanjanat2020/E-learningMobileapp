import 'package:elearning/constant/color.dart';
import 'package:elearning/widgets/custom_icon_button.dart';
import 'package:elearning/widgets/custom_tab_view.dart';
import 'package:elearning/widgets/custom_video_player.dart';
import 'package:elearning/widgets/enrollbottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SklCourseDetailsScreen extends StatefulWidget {
  const SklCourseDetailsScreen({super.key});

  @override
  State<SklCourseDetailsScreen> createState() => _SklCourseDetailsScreenState();
}

class _SklCourseDetailsScreenState extends State<SklCourseDetailsScreen> {
  int _selectedTag = 0;
  final scrollController = ScrollController();
  bool isBuyCartVisible = true;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(listen);
  }

  void listen() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = true;
      });
    }
  }

  void hide() {
    if (isBuyCartVisible) {
      setState(() {
        isBuyCartVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: ScreenUtil().setHeight(90),
            leading: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: CustomIconButton(
                child: Icon(Icons.arrow_back_ios_new_rounded),
                height: ScreenUtil().setHeight(35),
                width: ScreenUtil().setHeight(35),
                onTap: () {
                  Navigator.pop(context);
                }
              ),
            ),
            centerTitle: true,
            title: Text("Web Course"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setHeight(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomVideoPlayer(
                  videoId: "LSzYxSiZxNs",
                  startAt: Duration(seconds: 1),
                  endAt: Duration(minutes: 1, seconds: 36),
                ),
                SizedBox(height: 15),
                Text(
                  "Introduction to Web dev",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Created by mikelopster",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star_half_rounded, color: Colors.grey),
                    Text("4.8", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(16))),
                    SizedBox(width: 15),
                    Icon(Icons.timer, color: Colors.grey),
                    Text("6 Hours", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(16))),
                    Spacer(),
                    Text("\$50", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: ScreenUtil().setSp(20))),
                  ],
                ),
                SizedBox(height: 15),
                CustomTabView(changeTab: changeTab, index: _selectedTag),
                _selectedTag == 0
                    ? Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) => SizedBox(height: 20),
                          padding: EdgeInsets.only(top: 20, bottom: 40),
                          itemCount: 3, // เปลี่ยนเป็นจำนวนบทเรียนที่คุณต้องการแสดง
                          itemBuilder: (context, index) {
                            // แสดงบทเรียนที่พิมพ์โดยตรง
                            String lessonName;
                            String duration;

                            // กำหนดข้อมูลบทเรียนตาม index
                            switch (index) {
                              case 0:
                                lessonName = "Introduction to HTML";
                                duration = "15 minutes";
                                break;
                              case 1:
                                lessonName = "CSS Basics";
                                duration = "30 minutes";
                                break;
                              case 2:
                                lessonName = "JavaScript Fundamentals";
                                duration = "45 minutes";
                                break;
                              default:
                                lessonName = "";
                                duration = "";
                            }

                            return Row(
                              children: [
                                Icon(Icons.play_circle_rounded, size: 45, color: kPrimaryLight),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lessonName,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        duration,
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ) // ตัวอย่างคือบทเรียนที่ทำเสร็จแล้ว
                              ],
                            );
                          },
                        ),
                      )
                    : Description(),
              ],
            ),
          ),
          bottomSheet: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: isBuyCartVisible ? ScreenUtil().setHeight(60) : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
              child: BottomSheet(
                onClosing: () {},
                backgroundColor: Colors.white,
                enableDrag: false,
                builder: (context) {
                  return Wrap(children: [EnrollBottomSheet()]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry..."),
    );
  }
}
