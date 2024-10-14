import 'package:elearning/view/coursedetail/game/godotcourse_screen.dart';
import 'package:elearning/view/coursedetail/game/scratchcourse_screen.dart';
import 'package:elearning/view/coursedetail/game/ulcourse_screen.dart';
import 'package:elearning/view/coursedetail/game/unitycourse_screen.dart';
import 'package:elearning/view/coursedetail/language/Javacourse_screen.dart';
import 'package:elearning/view/coursedetail/language/ccourse_screen.dart';
import 'package:elearning/view/coursedetail/language/pythoncourse_screen.dart';
import 'package:elearning/view/coursedetail/language/rubycourse_screen.dart';
import 'package:elearning/view/coursedetail/ml/opencvcourse_screen.dart';
import 'package:elearning/view/coursedetail/ml/ptcourse_screen.dart';
import 'package:elearning/view/coursedetail/ml/sklcourse_screen.dart';
import 'package:elearning/view/coursedetail/ml/tfcourse_screen.dart';
import 'package:elearning/view/coursedetail/mobile/bootstrapcourse_screen.dart';
import 'package:elearning/view/coursedetail/mobile/fluttercourse_screen.dart';
import 'package:elearning/view/coursedetail/mobile/reactcourse_screen.dart';
import 'package:elearning/view/coursedetail/mobile/tailwindcourse_screen.dart';
import 'package:elearning/view/coursedetail/web/csscourse_screen.dart';
import 'package:elearning/view/coursedetail/web/htmlrcourse_screen.dart';
import 'package:elearning/view/coursedetail/web/jscourse_screen%20copy.dart';
import 'package:elearning/view/coursedetail/web/webrcourse_screen.dart';
import 'package:flutter/material.dart';

enum CourseType { Web, Mobile, Game, Ml, Languages }

class Course {
  String name;
  String author;
  String thumbnail;
  bool isfavorited;
  CourseType courseType;
  Widget detailcourse; 

  Course({
    required this.author,
    required this.name,
    required this.thumbnail,
    this.isfavorited = false,
    required this.courseType,
    required this.detailcourse, 
  });
}
//
class CourseProvider with ChangeNotifier {
  List<Course> _courses = [
    //web 4
    Course(
      author: "mikelopster",
      name: "Introduction to Web dev",
      thumbnail: "assets/icons/tag.png",
      isfavorited: false,
      courseType: CourseType.Web,
      detailcourse: WebCourseDetailsScreen(),
    ),
    Course(
      author: "Giraffe Academy",
      name: "HTML Full Courses",
      thumbnail: "assets/icons/HTML.png",
      isfavorited: false,
      courseType: CourseType.Web,
      detailcourse: HTMLCourseDetailsScreen(), 
    ),
    Course(
      author: "Giraffe Academy",
      name: "Javascript Full Courses",
      thumbnail: "assets/icons/js.png",
      isfavorited: false,
      courseType: CourseType.Web,
      detailcourse: JsCourseDetailsScreen(), 
    ),
    Course(
      author: "Giraffe Academy",
      name: "CSS Full Courses",
      thumbnail: "assets/icons/css.png",
      isfavorited: false,
      courseType: CourseType.Web,
      detailcourse: CssCourseDetailsScreen(), 
    ),

    //mobile 4
    Course(
      author: "Redhwan Nacef",
      name: "Building a Drawing App in React",
      thumbnail: "assets/icons/react.png",
      isfavorited: false,
      courseType: CourseType.Mobile,
      detailcourse: ReactCourseDetailsScreen(), 
    ),
    Course(
      author: "Smartherd",
      name: "Flutter Tutorial for Beginners",
      thumbnail: "assets/icons/flutter.png",
      isfavorited: false,
      courseType: CourseType.Mobile,
      detailcourse: FlutterCourseDetailsScreen(), 
    ),
    Course(
      author: "UI Code",
      name: "Mobile App using Bootstrap 4",
      thumbnail: "assets/icons/bootstrap.png",
      isfavorited: false,
      courseType: CourseType.Mobile,
      detailcourse: BootstrapCourseDetailsScreen(), 
    ),
    Course(
      author: "UI Code",
      name: "Mobile App using Tailwind CSS",
      thumbnail: "assets/icons/tailwild.png",
      isfavorited: false,
      courseType: CourseType.Mobile,
      detailcourse: TailwindCourseDetailsScreen(), 
    ),

    //game
    Course(
      author: "Yeahlowflicker",
      name: "Unity Beginner's Course",
      thumbnail: "assets/icons/unity.png",
      isfavorited: false,
      courseType: CourseType.Game,
      detailcourse: UnityCourseDetailsScreen(), 
    ),
    Course(
      author: "freeCodeCamp.org",
      name: "Unreal Engine 5 Full Course",
      thumbnail: "assets/icons/Unreal Engine.png",
      isfavorited: false,
      courseType: CourseType.Game,
      detailcourse: UlCourseDetailsScreen(), 
    ),
    Course(
      author: "Net Ninja",
      name: "Godot 4 Tutorial",
      thumbnail: "assets/icons/Godot.jpg",
      isfavorited: false,
      courseType: CourseType.Game,
      detailcourse: GodotCourseDetailsScreen(), 
    ),
    Course(
      author: "griffpatch",
      name: "How to Make a Scratch Game",
      thumbnail: "assets/icons/Scratch.jpg",
      isfavorited: false,
      courseType: CourseType.Game,
      detailcourse: ScratchCourseDetailsScreen(), 
    ),

    //ml 4
    Course(
      author: "Parwiz Forogh",
      name: "Python OpenCV Tutorial",
      thumbnail: "assets/icons/opencv.png",
      isfavorited: false,
      courseType: CourseType.Ml,
      detailcourse: OpencvCourseDetailsScreen(), 
    ),
     Course(
      author: "ProgrammingKnowledge",
      name: "Scikit-Learn Python Tutorial",
      thumbnail: "assets/icons/Scikit-Learn.jpg",
      isfavorited: false,
      courseType: CourseType.Ml,
      detailcourse: SklCourseDetailsScreen(), 
    ),
     Course(
      author: "Aladdin Persson",
      name: "TensorFlow 2.0 Beginner",
      thumbnail: "assets/icons/TensorFlow.jpg",
      isfavorited: false,
      courseType: CourseType.Ml,
      detailcourse: TfCourseDetailsScreen(), 
    ),
     Course(
      author: "Abhishek Thakur",
      name: "PyTorch 101",
      thumbnail: "assets/icons/PyTorch.jpg",
      isfavorited: false,
      courseType: CourseType.Ml,
      detailcourse: PtCourseDetailsScreen(), 
    ),

    //laguage 5
      Course(
      author: "ProgrammerType",
      name: "Python Full Course",
      thumbnail: "assets/icons/python.png",
      isfavorited: false,
      courseType: CourseType.Languages,
      detailcourse: PythonCourseDetailsScreen(), 
    ),
      Course(
      author: "ProgrammingKnowledge",
      name: "Java Tutorial For Beginners",
      thumbnail: "assets/icons/java.jpg",
      isfavorited: false,
      courseType: CourseType.Languages,
      detailcourse: JavaCourseDetailsScreen(), 
    ),
      Course(
      author: "Bro Code",
      name: "C tutorial for beginners ",
      thumbnail: "assets/icons/c.jpg",
      isfavorited: false,
      courseType: CourseType.Languages,
      detailcourse: CCourseDetailsScreen() 
    ),
      Course(
      author: "Giraffe Academy",
      name: "Ruby Full Course",
      thumbnail: "assets/icons/ruby.jpg",
      isfavorited: false,
      courseType: CourseType.Languages,
      detailcourse: RubyCourseDetailsScreen(), 
    ),
    Course(
      author: "Net Ninja",
      name: "Go Tutorial for Beginners",
      thumbnail: "assets/icons/go.jpg",
      isfavorited: false,
      courseType: CourseType.Languages,
      detailcourse: GodotCourseDetailsScreen(), 
    ),

  ];

  List<Course> get courses => _courses;

  void toggleFavoriteStatus(Course course) {
    course.isfavorited = !course.isfavorited;
    notifyListeners();
  }
}
