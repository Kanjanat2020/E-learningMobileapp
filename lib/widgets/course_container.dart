import 'package:elearning/Provider/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  final Widget goTo;

  const CourseContainer({super.key, required this.course, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => goTo),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Course Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Author: ${course.author}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            // Favorite Icon using LikeButton
            Consumer<CourseProvider>(
              builder: (context, courseProvider, _) {
                return LikeButton(
                  size: ScreenUtil().setHeight(33),
                  isLiked: course.isfavorited,
                  likeCountAnimationType: LikeCountAnimationType.all,
                  onTap: (isLiked) async {
                    courseProvider.toggleFavoriteStatus(course);
                    return !isLiked; // Toggle state
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
