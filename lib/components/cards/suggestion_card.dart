import 'package:flutter/material.dart';
import '../buttons/text_button.dart';
import '../custom_text.dart';
class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Color(0xFFE191C0),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('images/chair.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const RadialGradient(
                radius: 0.8,
                colors: [Color(0xAAFEC5E8), Color(0xAAE191C0)],
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    'Collect and Sell extraordinary NFTs',
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFilledButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            'Learn More',
                            color: Colors.white,
                            // fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}