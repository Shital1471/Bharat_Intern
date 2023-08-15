// ignore: file_names
import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    // // 2.point
    // path.lineTo(0, h);
    // // // 4.point
    // // path.lineTo(w, h);
    // path.quadraticBezierTo(w * 0.12, h - 800, w+30, h+40);
    // // 5.point
    // path.lineTo(w, 0);
    // path.close();
    // 3.point

    path.lineTo(0, h);
    var firstStart = Offset(w / 5, h);
    var firstEnd = Offset(w / 2.25, h - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(w - (w / 3.24), h - 105);
    var secondEnd = Offset(w, h - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
