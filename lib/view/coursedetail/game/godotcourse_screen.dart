import 'package:elearning/constant/color.dart';
import 'package:elearning/widgets/custom_icon_button.dart';
import 'package:elearning/widgets/custom_tab_view.dart';
import 'package:elearning/widgets/custom_video_player.dart';
import 'package:elearning/widgets/enrollbottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GodotCourseDetailsScreen extends StatefulWidget {
  const GodotCourseDetailsScreen({super.key});

  @override
  State<GodotCourseDetailsScreen> createState() => _GodotCourseDetailsScreenState();
}

class _GodotCourseDetailsScreenState extends State<GodotCourseDetailsScreen> {
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
            title: Text("Godot Course"),
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
                  videoId: "q7wlSvt0JIc",
                  startAt: Duration(seconds: 1),
                  endAt: Duration(minutes: 1, seconds: 36),
                ),
                SizedBox(height: 15),
                Text(
                  "Introduction to Godot Game Development",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Created by Net Ninja",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star_half_rounded, color: Colors.grey),
                    Text("4.9", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(16))),
                    SizedBox(width: 15),
                    Icon(Icons.timer, color: Colors.grey),
                    Text("8 Hours", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(16))),
                    Spacer(),
                    Text("\$60", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: ScreenUtil().setSp(20))),
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
                          itemCount: 15, // จำนวนบทเรียนที่คุณต้องการแสดง
                          itemBuilder: (context, index) {
                            // แสดงบทเรียนที่พิมพ์โดยตรง
                            String lessonName;
                            String duration;

                            // กำหนดข้อมูลบทเรียนตาม index
                            switch (index) {
                              case 0:
                                lessonName = "Getting Started with Godot";
                                duration = "20 minutes";
                                break;
                              case 1:
                                lessonName = "Creating Your First Game";
                                duration = "40 minutes";
                                break;
                              case 2:
                                lessonName = "Understanding Scenes and Nodes";
                                duration = "50 minutes";
                                break;
                              case 3:
                                lessonName = "Working with GDScript Basics";
                                duration = "30 minutes";
                                break;
                              case 4:
                                lessonName = "Game Physics and Collision Detection";
                                duration = "45 minutes";
                                break;
                              case 5:
                                lessonName = "Creating 2D Sprites and Animation";
                                duration = "35 minutes";
                                break;
                              case 6:
                                lessonName = "Building User Interfaces";
                                duration = "25 minutes";
                                break;
                              case 7:
                                lessonName = "Implementing Audio and Sound Effects";
                                duration = "30 minutes";
                                break;
                              case 8:
                                lessonName = "Creating 3D Environments";
                                duration = "60 minutes";
                                break;
                              case 9:
                                lessonName = "Scripting Game Logic with GDScript";
                                duration = "40 minutes";
                                break;
                              case 10:
                                lessonName = "Saving and Loading Game Data";
                                duration = "30 minutes";
                                break;
                              case 11:
                                lessonName = "Exporting Your Game";
                                duration = "20 minutes";
                                break;
                              case 12:
                                lessonName = "Debugging and Performance Optimization";
                                duration = "45 minutes";
                                break;
                              case 13:
                                lessonName = "Publishing Your Game on Platforms";
                                duration = "25 minutes";
                                break;
                              case 14:
                                lessonName = "Building a Multiplayer Game";
                                duration = "50 minutes";
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
                                )
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
      child: Text("Learn the fundamentals of Godot, a powerful and open-source game engine. This course covers all the basics to get you started on your game development journey."),
    );
  }
}
