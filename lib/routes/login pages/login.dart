import '../../../components/buttons/text_button.dart';
import '../../../components/custom_page_route.dart';
import '../bottom nav bar screens/common_home_page.dart';
import '../bottom%20nav%20bar%20screens/home%20page%20of%20e%20commerce/home_page.dart';
import 'package:bfm/routes/login%20pages/verify_number.dart';
import 'package:flutter/material.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSync = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        actions: [
          CustomTextButton(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                'Skip for now',
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CustomPageRoute(child: const CommonPage()),
              );
            },
          )
        ],
      ),
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
              const SizedBox(
                height: 10,
              ),
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
                  const SizedBox(height: 10),
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
                        const CustomText(
                          '+91',
                          fontSize: 17,
                        ),
                        Container(
                          height: 25,
                          width: 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
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
              const SizedBox(
                height: 35,
              ),
              CustomFilledButton(
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: const CustomText(
                  'Continue',
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      CustomPageRoute(child: const VerifyNumberPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
