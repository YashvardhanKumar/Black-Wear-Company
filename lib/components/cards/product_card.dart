import 'package:flutter/material.dart';
import '../custom_icon_icons.dart';
import '../custom_text.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.prevPrice,
    required this.discountedPrice,
    required this.isLiked,
    required this.onLiked,
    this.onCardClicked, this.onCardLongPress,
  });

  final String? prevPrice;
  final String discountedPrice;
  final bool isLiked;
  final VoidCallback onLiked;
  final VoidCallback ?onCardClicked, onCardLongPress;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: widget.onCardClicked,
            onLongPress: widget.onCardLongPress,
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'images/product.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: (widget.prevPrice != null)
                              ? '${widget.prevPrice} '
                              : null,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff49454F),
                            decoration: TextDecoration.lineThrough,
                          ),
                          children: [
                            TextSpan(
                              text: widget.discountedPrice,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow.shade800,
                          ),
                          const CustomText(
                            '4.5',
                            color: Color(0xff49454F),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    'Product Name',
                    color: Color(0xff696D84),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onLiked,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CustomIcon.heart,
                    color: widget.isLiked ? Colors.red.shade800 : Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
