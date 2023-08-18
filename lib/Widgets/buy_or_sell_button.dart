import 'package:flutter/material.dart';
import 'package:virtual_exchange/Widgets/BuyOrSellButton/flutter_toggle_tab.dart';
import 'package:virtual_exchange/string_and_consts.dart';

class BuyOrSellButton extends StatefulWidget {
  const BuyOrSellButton({super.key});

  @override
  State<BuyOrSellButton> createState() => _BuyOrSellButtonState();
}

class _BuyOrSellButtonState extends State<BuyOrSellButton> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ToggleButton(
      width: 50,
      borderRadius: 5,
      selectedTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      selectedBackgroundColors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      unSelectedTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
      labels: ["Buy", "Sell"],
      selectedIndex: index,
      selectedLabelIndex: (index) {
        setState(() {
          setState(() {
            this.index = index;
          });
        });
      },
    );
  }
}

// class BuyOrSellButton extends StatefulWidget {
//   const BuyOrSellButton({super.key});
//
//   @override
//   State<BuyOrSellButton> createState() => _BuyOrSellButtonState();
// }
//
// class _BuyOrSellButtonState extends State<BuyOrSellButton> {
//   bool buying = true;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(.3), borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               buying = true;
//               setState(() {});
//             },
//             child: CustomPaint(
//               painter: BuyPainter(color: buying ? Colors.blue : Colors.transparent),
//               size: Size(size.width * .25, 50), // Adjust size as needed
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               buying = false;
//               setState(() {});
//             },
//             child: CustomPaint(
//               painter: SellPainter(color: !buying ? Colors.blue : Colors.transparent),
//               size: Size(size.width * .25, 50), // Adjust size as needed
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BuyPainter extends CustomPainter {
//   final Color color;
//
//   BuyPainter({required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width - 20, 0);
//     path.lineTo(size.width, size.height / 2);
//     path.lineTo(size.width - 20, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class SellPainter extends CustomPainter {
//   final Color color;
//
//   SellPainter({required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     path.moveTo(20, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(20, size.height);
//     path.lineTo(0, size.height / 2);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class ToggleButton extends StatefulWidget {
//   const ToggleButton({super.key});
//
//   @override
//   _ToggleButtonState createState() => _ToggleButtonState();
// }
//
// const double width = 300.0;
// const double height = 60.0;
// const double loginAlign = -1;
// const double signInAlign = 1;
// const Color selectedColor = Colors.white;
// const Color normalColor = Colors.black54;
//
// class _ToggleButtonState extends State<ToggleButton> {
//   double? xAlign;
//   Color? loginColor;
//   Color? signInColor;
//
//   @override
//   void initState() {
//     super.initState();
//     xAlign = loginAlign;
//     loginColor = selectedColor;
//     signInColor = normalColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Demo'),
//       ),
//       body: Center(
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.all(
//               Radius.circular(50.0),
//             ),
//           ),
//           child: Stack(
//             children: [
//               AnimatedAlign(
//                 alignment: Alignment(xAlign ?? 0.0, 0),
//                 duration: Duration(milliseconds: 300),
//                 child: Container(
//                   width: width * 0.5,
//                   height: height,
//                   decoration: BoxDecoration(
//                     color: Colors.lightGreen,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(50.0),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     xAlign = loginAlign;
//                     loginColor = selectedColor;
//
//                     signInColor = normalColor;
//                   });
//                 },
//                 child: Align(
//                   alignment: Alignment(-1, 0),
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         color: loginColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     xAlign = signInAlign;
//                     signInColor = selectedColor;
//
//                     loginColor = normalColor;
//                   });
//                 },
//                 child: Align(
//                   alignment: Alignment(1, 0),
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Signin',
//                       style: TextStyle(
//                         color: signInColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
