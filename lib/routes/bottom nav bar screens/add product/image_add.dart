import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/nft_product_add_success.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ImageAddPage extends StatefulWidget {
  const ImageAddPage({Key? key}) : super(key: key);

  @override
  State<ImageAddPage> createState() => _ImageAddPageState();
}

class _ImageAddPageState extends State<ImageAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomText(
          'Upload',
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern: const [10, 8],
                color: Colors.black,
                strokeWidth: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.blue.shade50,
                        shape: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.image_rounded,
                            size: 35,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        'Upload your Image',
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      const CustomText(
                        'Browse',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              label: 'Title',
              hintText: 'Title of your NFT',
              required: true,
              maxLines: 1,
            ),
            const CustomTextField(
              label: 'Description',
              hintText: 'Description of your NFT',
              maxLength: 250,
              maxLines: 6,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFilledButton(
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomText(
                  'Upload',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                Navigator.push(context, CustomPageRoute(child: const NFTAddSuccess()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.validators,
    this.required = false,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? validators;
  final bool required;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CustomText(
                label,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              if (required)
                const CustomText(
                  '*',
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 20,
                spreadRadius: 6,
                color: Colors.grey.shade400.withOpacity(0.5),
              )
            ],
          ),
          child: TextFormField(
            minLines: maxLines ?? 1,
            maxLines: maxLines,
            cursorColor: Colors.grey.shade400,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  TextStyle(fontFamily: 'Poppins', color: Colors.grey.shade400),
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
