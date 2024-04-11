import 'package:flutter/material.dart';

class CustomSlideAnimation extends PageRouteBuilder {
  final Widget child;

  CustomSlideAnimation({required this.child})
      : super(pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}

// class CustomPopUpAnimation extends PageRouteBuilder {
//   final Widget child;

//   CustomPopUpAnimation({required this.child})
//       : super(pageBuilder: (context, animation, secondaryAnimation) => child);
// }
