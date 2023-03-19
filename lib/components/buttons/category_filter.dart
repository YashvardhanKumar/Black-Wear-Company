// import 'package:flutter/material.dart';
//
// import 'text_button.dart';
// import '../custom_text.dart';
//
//
// class Categories extends StatelessWidget {
//   const Categories({
//     Key? key,
//     required this.icon,
//     required this.text,
//   }) : super(key: key);
//   final Icon icon;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: CustomOutlineButton(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconTheme(
//                 data: const IconThemeData(color: Color(0xff595757),
//         ),
//                 child: icon,
//               ),
//               const SizedBox(
//                 width: 12,
//               ),
//               CustomText(
//                 text,
//                 color: Color(0xff595757),
//                 // fontWeight: FontWeight.w600,
//               )
//             ],
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
