import 'package:flutter/material.dart';
import '../custom_text.dart';
class TopCreatorListCard extends StatelessWidget {
  const TopCreatorListCard({
    Key? key,
    this.topCreator,
  }) : super(key: key);
  final String? topCreator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            foregroundImage: AssetImage('images/man.jpg'),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                topCreator ?? 'CyptoPenks',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              const CustomText(
                "+ 24.18%",
                color: Color(0xFF23A757),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          )
        ],
      ),
    );
  }
}