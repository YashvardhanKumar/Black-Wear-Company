import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/home_page.dart';
import 'package:bfm/routes/common_home_page.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';

class VerifyNumberPage extends StatefulWidget {
  const VerifyNumberPage({Key? key}) : super(key: key);

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  late FocusNode focusNode1, focusNode2, focusNode3, focusNode4, focusNode5;
  late TextEditingController c1, c2, c3, c4, c5;

  String? errorText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
    focusNode1.requestFocus();
  }

  @override
  void dispose() {
    focusNode5.dispose();
    focusNode4.dispose();
    focusNode3.dispose();
    focusNode2.dispose();
    focusNode1.dispose();
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    'Enter OTP',
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'We’ve sent an SMS with an activation code to your phone',
                      children: [
                        const TextSpan(
                          text:
                            ' +33 2 94 27 84 11',
                            style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            ),
                        ),
                      ],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                        color: Colors.black.withOpacity(0.5)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: OTPBox(
                          errorText: errorText,
                          controller: c1,
                          focusNode: focusNode1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              c1.text = value.characters.first;
                              if (c5.text.isEmpty &&
                                  c2.text.isEmpty &&
                                  c3.text.isEmpty &&
                                  c4.text.isEmpty) {
                                errorText = null;
                                setState(() {});
                              }
                              if (value.length == 2) {
                                c2.text = value.characters.last;
                              }
                              focusNode2.requestFocus();
                            } else {
                              c1.text = '';
                              focusNode1.unfocus();
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: OTPBox(
                          controller: c2,
                          errorText: errorText,
                          focusNode: focusNode2,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              c2.text = value.characters.first;
                              if (value.length == 2) {
                                c3.text = value.characters.last;
                              }
                              focusNode3.requestFocus();
                            } else {
                              c2.text = '';
                              focusNode1.requestFocus();
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: OTPBox(
                          errorText: errorText,
                          controller: c3,
                          focusNode: focusNode3,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              c3.text = value.characters.first;
                              if (value.length == 2) {
                                c4.text = value.characters.last;
                              }
                              focusNode4.requestFocus();
                            } else {
                              c3.text = '';
                              focusNode2.requestFocus();
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: OTPBox(
                          errorText: errorText,
                          controller: c4,
                          focusNode: focusNode4,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              c4.text = value.characters.first;
                              if (value.length == 2) {
                                c5.text = value.characters.last;
                              }
                              focusNode5.requestFocus();
                            } else {
                              c4.text = '';
                              focusNode3.requestFocus();
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: OTPBox(
                          controller: c5,
                          focusNode: focusNode5,
                          errorText: errorText,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              c5.text = value.characters.first;
                              setState(() {});
                              focusNode5.unfocus();
                              if (c1.text.isNotEmpty &&
                                  c2.text.isNotEmpty &&
                                  c3.text.isNotEmpty &&
                                  c4.text.isNotEmpty) {
                                String otp = c1.text +
                                    c2.text +
                                    c3.text +
                                    c4.text +
                                    c5.text;

                                if (otp != '25017') {
                                  errorText = 'Wrong Code, Please Try Again';
                                  setState(() {});
                                  c1.clear();
                                  c2.clear();
                                  c3.clear();
                                  c4.clear();
                                  c5.clear();
                                } else {
                                  errorText = null;
                                  setState(() {});
                                  while (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                  Navigator.pushReplacement(context,
                                      CustomPageRoute(child: const CommonPage()));
                                }
                              }
                            } else {
                              c5.text = '';
                              focusNode4.requestFocus();
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    height: (errorText != null) ? 29 : 0,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        // color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(20)),
                    duration: const Duration(milliseconds: 200),
                    child: (errorText != null)
                        ? CustomText(
                            errorText!,
                            color: Colors.red.shade800,
                          )
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Send Code Again',
                        children: [
                          TextSpan(
                            text: ' 00:20',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}

class OTPBox extends StatelessWidget {
  const OTPBox({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceSansPro'),
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: (errorText != null)
                    ? Colors.red.shade800
                    : (controller.text.isNotEmpty)
                        ? Colors.black
                        : const Color(0xffD8DADC),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (errorText != null)
                    ? Colors.red.shade800
                    : (controller.text.isNotEmpty)
                        ? Colors.black
                        : const Color(0xffD8DADC),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: (errorText != null) ? Colors.red.shade800 : Colors.black,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
