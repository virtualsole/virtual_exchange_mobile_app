// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: NestedScrollExample(),
//     );
//   }
// }
//
// class NestedScrollExample extends StatelessWidget {
//   const NestedScrollExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             const SliverAppBar(
//               pinned: true,
//               title: Text('Nested Scroll Example'),
//               expandedHeight: 200,
//               flexibleSpace: FlexibleSpaceBar(),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return ListTile(title: Text('Book $index'));
//                 },
//                 childCount: 10, // Number of books
//               ),
//             ),
//             SliverPersistentHeader(
//               pinned: true,
//               delegate: SliverAppBarDelegate(
//                 minHeight: 50,
//                 maxHeight: 50,
//                 child: Container(
//                   color: Colors.blue,
//                   alignment: Alignment.center,
//                   child: const Text('Peoples'),
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return ListTile(title: Text('Person $index'));
//                 },
//                 childCount: 100, // Number of people
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   SliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });
//
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//
//   @override
//   double get minExtent => minHeight;
//   @override
//   double get maxExtent => maxHeight;
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }
//
//   @override
//   bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
