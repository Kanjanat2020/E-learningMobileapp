import 'package:elearning/constant/color.dart';
import 'package:elearning/models/lesson.dart';
import 'package:elearning/widgets/custom_icon_button.dart';
import 'package:elearning/widgets/custom_tab_view.dart';
import 'package:elearning/widgets/custom_video_player.dart';
import 'package:elearning/widgets/enrollbottom_sheet.dart';
import 'package:elearning/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ReactCourseDetailsScreen extends StatefulWidget {
  const ReactCourseDetailsScreen({super.key});

  @override
  State<ReactCourseDetailsScreen> createState() => _ReactCourseDetailsScreenState();
}

class _ReactCourseDetailsScreenState extends State<ReactCourseDetailsScreen> {
  int _selectedTag = 0;
  final scrollController = ScrollController();
  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  bool isBuyCartVisible = true;
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
              padding: EdgeInsets.all(
                ScreenUtil().setWidth(10),
              ),
              child: CustomIconButton(
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                  height: ScreenUtil().setHeight(35),
                  width: ScreenUtil().setHeight(35),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
            centerTitle: true,
            title: Text("Flutter Course"),
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
                  videoId: "NoayIGu-4oE",
                  startAt: Duration(seconds: 1),
                  endAt: Duration(minutes: 1, seconds: 36),
                ),
                SizedBox(height: 15),
                Text(
                  "Flutter Course For Beginners",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Created by Dear Programmer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.grey,
                    ),
                    Text(
                      "4.8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    Text(
                      " 6 Hours",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$50",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTabView(changeTab: changeTab, index: _selectedTag),
                _selectedTag == 0
                    ? PlaylistWidget(controller: scrollController)
                    : Description(),
              ],
            ),
          ),
          bottomSheet: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: isBuyCartVisible ? ScreenUtil().setHeight(60) : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(5),
              ),
              child: BottomSheet(
                  onClosing: () {},
                  backgroundColor: Colors.white,
                  enableDrag: false,
                  builder: (context) {
                    return Wrap(
                      children: [EnrollBottomSheet()],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaylistWidget extends StatelessWidget {
  final ScrollController controller;

  const PlaylistWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
          child: ListView.separated(
        controller: controller,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20);
        },
        padding: EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -30,
                child: FadeInAnimation(
                  child: LessonCard(
                    lesson: lessonList[index],
                  ),
                ),
              ));
        },
      )),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
    );
  }
}
