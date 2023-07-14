import 'package:get_storage/get_storage.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_page_route.dart';
import '../bottom nav bar screens/common_home_page.dart';
import 'package:bfm/routes/login%20pages/verify_number.dart';
import 'package:flutter/material.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_text.dart';

final box = GetStorage('UserStatus');

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryCode = '+91';
  bool isSync = false;
  final _formKey = GlobalKey<FormState>();

  String? _phoneNumberValidator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        actions: [
          if (!(box.read('isAnonymous') ?? false))
            CustomTextButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  'Skip for now',
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                box.write('isAnonymous', true);
                box.write('isLogin', false);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: const [
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
                        CustomTextButton(
                          onPressed: () {},
                          child: CustomText(
                            countryCode,
                            fontSize: 17,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 0.5,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Flexible(
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              autofocus: true,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Mobile No. to continue';
                                } else {
                                  return _phoneNumberValidator(
                                      '$countryCode$value');
                                }
                              },
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
                  if(_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      CustomPageRoute(child: const VerifyNumberPage()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
