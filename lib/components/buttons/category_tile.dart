import 'package:flutter/material.dart';
import '../custom_text.dart';
class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.all(5),
      alignment: Alignment.bottomLeft,
      // width: 140,
      height: 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.grey,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                'Category', fontWeight: FontWeight.w600, fontSize: 18,),
              CustomText('200 Products', color: Colors.grey.shade700,),
            ],
          )
        ],
      ),
    );
  }
}