import 'package:flutter/material.dart';
import '../../routes/bottom nav bar screens/home page of e commerce/cart_page.dart';
import '../page_as_components/search_page.dart';
import '../custom_page_route.dart';
import '../custom_text.dart';
class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    super.key,
    required this.hintText,
    required this.isNFTResults,
  });

  final String hintText;
  final bool isNFTResults;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          //TODO: NFT Search Page
          Navigator.push(
            context,
            CustomPageRoute(
              child: SearchPage(
                isNFTResults: isNFTResults,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefe9f5),
            borderRadius: BorderRadius.circular(50),
          ),
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: CustomText(
                      hintText,
                      color: Color(0xff49454F),
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.search_rounded,
                    color: Color(0xff49454F),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}