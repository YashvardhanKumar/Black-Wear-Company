import 'package:flutter/material.dart';

import 'buttons/text_button.dart';
import 'custom_text.dart';

class CategoryOfPreference extends StatelessWidget {
  const CategoryOfPreference({
    Key? key,
    required this.heading,
    required this.onSeeAllClicked,
  }) : super(key: key);
  final String heading;
  final VoidCallback onSeeAllClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            heading,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomTextButton(
              onPressed: onSeeAllClicked,
              child: const CustomText(
                'View all',
                fontSize: 15,
                color: Color(0xFF2972FE),
              ),
            ),
          )
        ],
      ),
    );
  }
}
