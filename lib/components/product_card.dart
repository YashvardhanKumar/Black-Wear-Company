import 'package:flutter/material.dart';

import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.prevPrice,
    required this.discountedPrice,
    required this.isLiked,
  });

  final String? prevPrice;
  final String discountedPrice;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/product.png',
                      ),
                    ),
                  ),
                  // child: Image.asset(
                  //   'images/product.png',
                  //   fit: BoxFit.fill,
                  // ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: (prevPrice != null) ? '$prevPrice ' : null,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xff49454F),
                          decoration: TextDecoration.lineThrough,
                        ),
                        children: [
                          TextSpan(
                            text: discountedPrice,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                        ),
                        CustomText(
                          '4.5',
                          color: Color(0xff49454F),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.favorite_rounded,
                  color: isLiked ? Colors.red.shade800 : Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}