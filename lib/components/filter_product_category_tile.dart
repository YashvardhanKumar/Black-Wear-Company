import 'package:flutter/material.dart';
import 'custom_text.dart';
class FilterProductCategory extends StatelessWidget {
  const FilterProductCategory({
    super.key,
    required this.selected,
    required this.onTap,
    required this.title,
  });

  final bool selected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListTile(
        minVerticalPadding: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedTileColor: Colors.black,
        selected: selected,
        onTap: onTap,
        style: ListTileStyle.drawer,
        selectedColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
        title: CustomText(
          title,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}