// import 'dart:async';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: App(),
//     ),
//   );
// }
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   double h = 0;
//   Timer? timer;
//
//   void startTimer(bool? reverse) {
//     timer = Timer.periodic(const Duration(milliseconds: 20), (Timer timer) {
//       setState(() {
//         reverse == false ? h++ : h--;
//       });
//       print(h);
//
//       if (h >= MediaQuery.of(context).size.width / 2) {
//         this.timer?.cancel();
//       } else if (h <= 0) {
//         this.timer?.cancel();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ElevatedButton(
//         onPressed: () {
//           startTimer(true);
//         },
//         child: const Text("Reset"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           startTimer(false);
//         },
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: h,
//               backgroundColor: Colors.red,
//               child: h >= 10
//                   ? CircleAvatar(
//                       radius: h - 10,
//                       backgroundColor: Colors.yellow,
//                       child: h >= 20
//                           ? CircleAvatar(
//                               radius: h - 20,
//                               backgroundColor: Colors.teal,
//                               child: h >= 30
//                                   ? CircleAvatar(
//                                       radius: h - 30,
//                                       backgroundColor: Colors.brown,
//                                       child: h >= 40
//                                           ? CircleAvatar(
//                                               radius: h - 40,
//                                               backgroundColor: Colors.white,
//                                             )
//                                           : null,
//                                     )
//                                   : null,
//                             )
//                           : null,
//                     )
//                   : null,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
