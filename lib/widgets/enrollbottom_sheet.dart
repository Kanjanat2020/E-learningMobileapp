import 'package:elearning/constant/color.dart';
import 'package:elearning/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({super.key});

  @override
  State<EnrollBottomSheet> createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: CustomIconButton(
              child: Text(
                "Enroll Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              color: kPrimaryColor,
              height: 45,
              width: 45,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
