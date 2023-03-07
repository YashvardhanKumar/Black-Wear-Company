import 'package:flutter/material.dart';

import '../custom_text.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.bottomLeft,
      width: 140,
      height: 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Container(
        width: 70,
        padding: const EdgeInsets.all(10),
        height: 80,
        color: Colors.blueGrey,
        child: const CustomText(
          'Category',
          maxLines: 2,
        ),
      ),
    );
  }
}