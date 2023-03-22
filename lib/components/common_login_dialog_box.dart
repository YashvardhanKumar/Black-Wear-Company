import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/login%20pages/login.dart';
import 'package:flutter/material.dart';

class CommonLoginDialogBox extends StatefulWidget {
  const CommonLoginDialogBox({Key? key}) : super(key: key);

  @override
  State<CommonLoginDialogBox> createState() => _CommonLoginDialogBoxState();
}

class _CommonLoginDialogBoxState extends State<CommonLoginDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: CustomText('Login to continue'),
      content: CustomText('To access this, you have to login first'),
      actions: [
        FilledButton(
          child: CustomText('Login'),
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, CustomPageRoute(child: LoginPage()));
          },
        ),
        FilledButton.tonal(
            style:
                FilledButton.styleFrom(backgroundColor: Colors.grey.shade300),
            child: CustomText('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
