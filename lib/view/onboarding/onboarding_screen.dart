import 'package:animate_do/animate_do.dart';
import 'package:elearning/auth/login.dart';
import 'package:elearning/constant/color.dart';
import 'package:elearning/view/onboarding/content/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  bool lastPage = false;

  void setState(VoidCallback fn) {
    lastPage = _currentPage == 2 ? true : false;
    super.setState(fn);
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: _currentPage == index
            ? kPrimaryColor
            : kPrimaryLight.withOpacity(0.45),
      ),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenUtil().setHeight(30),
                          ),
                          contents[index].animations,
                          SizedBox(
                            height: (height >= 840)
                                ? ScreenUtil().setHeight(60)
                                : ScreenUtil().setHeight(80),
                          ),
                          Text(
                            contents[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setHeight(25),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(22),
                          ),
                          Text(
                            contents[index].subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w300,
                              fontSize: ScreenUtil().setSp(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: EdgeInsets.all(30),
                          child: FadeInRight(
                            duration: Duration(milliseconds: 150),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryLight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    padding: (width <= 550)
                                        ? EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 20)
                                        : EdgeInsets.symmetric(
                                            vertical: 25,
                                            horizontal: width * 0.2),
                                    textStyle: TextStyle(
                                      fontSize: (width <= 550) ? 13 : 17,
                                    )),
                                child: Text(
                                  "Get Started",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(16),
                                  ),
                                )),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 500) ? 13 : 17,
                                    )),
                                child: Text(
                                  "SKIP",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryLight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                    elevation: 0,
                                    padding: (width <= 550)
                                        ? EdgeInsets.symmetric(vertical: 20)
                                        : EdgeInsets.symmetric(
                                            vertical: 25,
                                          ),
                                    textStyle: TextStyle(
                                      fontSize: (width <= 550) ? 13 : 17,
                                    )),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
