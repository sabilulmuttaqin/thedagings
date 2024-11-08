import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background for a more vibrant effect
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red.shade900, Colors.red.withOpacity(0.6)],
              stops: [0.2, 1],
            ),
          ),
        ),

        // Adding more curves and layers for depth
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: BottomCurvedClipper(),
            child: Container(
              height: 530,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.2)
                  ],
                  stops: [0.2, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, -5), // Subtle shadow effect
                  ),
                ],
              ),
            ),
          ),
        ),

        // Main content
        child,
      ],
    );
  }
}

// Custom clipper for a more complex bottom curved shape
class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 10); // Slight curve height

    // More pronounced curve with an adjusted control point for fluidity
    path.quadraticBezierTo(
      size.width / 3, // Control point x (start curve more shallow)
      80, // Control point y (more curve to create a subtle arc)
      size.width, // End point x
      30, // End point y (keeping curve gentle)
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
