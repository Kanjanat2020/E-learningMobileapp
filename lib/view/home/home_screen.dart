import 'package:elearning/constant/color.dart';
import 'package:elearning/models/category.dart';
import 'package:elearning/view/Notification/notifiacation.dart';
import 'package:elearning/widgets/category_card.dart';
import 'package:elearning/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    height: ScreenUtil().setHeight(210),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.5],
                        colors: [
                          Color.fromARGB(255, 253, 213, 104),
                          Color.fromARGB(255, 219, 162, 4),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -75,
                          left: 42,
                          child: Image.asset(
                            "assets/images/Colors Icon.png",
                            width: 350,
                            height: 400,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.black,
                                          height: 1.5,
                                        ),
                                    children: const [
                                      TextSpan(
                                        text: "Hello,\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "welcome to the online course",
                                      ),
                                    ],
                                  ),
                                ),
                                CircleButton(
                                  icon: Icons.notifications,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationPage(), // ลิงก์ไปยัง NotificationPage
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                                suffixIcon: const Icon(
                                  Icons.mic,
                                  color: kPrimaryColor,
                                  size: 26,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: "Search your topic",
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.yellow, width: 2.0),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                isDense: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explore Categories",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimationLimiter(
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          controller: _scrollController,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 24,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          shrinkWrap: true,
                          children:
                              List.generate(categoryList.length, (index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1000),
                                child: FadeInAnimation(
                                  child: CategoryCard(
                                    category: categoryList[index],
                                    goTo: categoryList[index].link,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
