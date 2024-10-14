import 'package:elearning/view/coursescreen/gamecourse_screen.dart';
import 'package:elearning/view/coursescreen/languagecourse_screen.dart';
import 'package:elearning/view/coursescreen/mlcourse_screen.dart';
import 'package:elearning/view/coursescreen/mobilecourse_screen.dart';
import 'package:elearning/view/coursescreen/webcourse_screen.dart';
import 'package:flutter/material.dart';

class Category {
  String thumbnail;
  String name;
  int noOfCourses;
  Widget link ;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
    required this.link,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Web Development',
    noOfCourses: 4,
    thumbnail: 'assets/images/web_dev.png',
    link: WebCourseScreen(),
  ),
  Category(
    name: 'Mobile Development',
    noOfCourses: 4,
    thumbnail: 'assets/images/mobile_dev.png',
    link: MobileCourseScreen(),
  ),
  Category(
    name: 'Game Development',
    noOfCourses: 4,
    thumbnail: 'assets/images/game_dev.png',
    link: GameCourseScreen(),
  ),
  Category(
    name: 'Machine Learning & AI',
    noOfCourses: 4,
    thumbnail: 'assets/images/ai_ml.png',
    link: MlCourseScreen(),
  ),
  Category(
    name: 'Programming Languages',
    noOfCourses: 5,
    thumbnail: 'assets/images/programming_languages.png',
    link: LanguagesCourseScreen(),
  ),
];
