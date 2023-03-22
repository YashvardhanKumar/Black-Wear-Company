import 'package:get_storage/get_storage.dart';

class MyPref {
  static final _otherBox = () => GetStorage('MyPref');

  final isAnonymous = true.val('isAnonymous');
  final isLogin = false.val('age');
  final price = 1000.val('price', getBox: _otherBox);
}


void updateAge() {
  final age = 0.val('age');
  // or

  age.val = 1; // will save to box
  final realAge = age.val; // will read from box
}