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
      title: const CustomText('Login to continue'),
      content: const CustomText('To access this, you have to login first'),
      actions: [
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, CustomPageRoute(child: const LoginPage()));
          },
          child: const CustomText('Login'),
        ),
        FilledButton.tonal(
          style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade300),
          child: const CustomText('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
