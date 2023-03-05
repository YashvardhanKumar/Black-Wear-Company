import 'package:bfm/components/buttons/text_button.dart';
import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSync = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.paddingOf(context);
    double heightKeyboard = MediaQuery.of(context).viewInsets.bottom;
    double height = size.height - 70 - padding.vertical - heightKeyboard;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                'Log in',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10,),
              CustomText(
                'Please confirm your country code and enter your phone number.',
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFFD8DADC),
                    height: 0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        CustomText(
                          '🇮🇳',
                          fontSize: 18,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        CustomText(
                          'India',
                          fontSize: 18,
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 1,
                          color: Color(0xFFD8DADC),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          '+91',
                          fontSize: 17,
                        ),
                        Container(
                          height: 25,
                          width: 0.5,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Flexible(
                          child: TextField(
                            autofocus: true,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '0 00 00 00',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black.withOpacity(0.5),
                              ),
                              isCollapsed: true,
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Sync Contacts',
                    fontSize: 16,
                  ),
                  Transform.scale(
                    scale: 0.85,
                    child: Switch(
                      value: isSync,
                      onChanged: (value) {
                        isSync = !isSync;
                        setState(() {});
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.black,
                      inactiveThumbColor: Colors.black,
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              CustomFilledButton(
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: CustomText(
                  'Continue',
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
