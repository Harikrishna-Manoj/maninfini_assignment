// import 'package:flutter/material.dart';
// import 'package:maninfini_task/core/debounce/debounce.dart';
// import 'package:maninfini_task/core/model/model.dart';

// class CustomTextField extends StatefulWidget {
//   // ignore: use_key_in_widget_constructors
//   const CustomTextField({
//     required this.searchController,
//     required this.filterData,
//   });
//   final List<Data>? filterData;
//   final TextEditingController searchController;
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   final debouncer = Debouncer(milliseconds: 500);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Material(
//         child: TextFormField(
//           cursorColor: Colors.black,
//           keyboardType: TextInputType.text,
//           style: const TextStyle(color: Colors.black),
//           controller: widget.searchController,
//           decoration: const InputDecoration(
//               contentPadding: EdgeInsets.only(bottom: 35, left: 15),
//               prefixIcon: Icon(Icons.search),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//               hintText: 'Enter for filter',
//               hintStyle:
//                   TextStyle(fontSize: 15, height: 1.5, color: Colors.black)),
//           onChanged: (value) {
//             debouncer.run(() {
//               setState(() {
//                 myData = filterData!
//                     .where((element) => element.name!
//                         .toString()
//                         .toLowerCase()
//                         .contains(value.toLowerCase()))
//                     .toList();
//               });
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
