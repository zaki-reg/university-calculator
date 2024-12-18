import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_calculator_test/constants.dart';

class CustomShapePainter extends CustomPainter {
  final double edgeRadius; // For rounded corners
  final double bigRectHeight; // Height of the big rectangle
  final double smallRectHeight; // Height of the small rectangle
  final double smallRectWidth; // Width of the small rectangle

  CustomShapePainter({
    this.edgeRadius = 20.0,
    required this.bigRectHeight,
    required this.smallRectHeight,
    required this.smallRectWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = limeGreen
      ..style = PaintingStyle.fill;

    final path = Path();

    double smallRectTop = bigRectHeight - smallRectHeight;

    // Start at bottom-left
    path.moveTo(0, bigRectHeight - edgeRadius);
    path.quadraticBezierTo(0, bigRectHeight, edgeRadius, bigRectHeight);

    // Bottom-right corner
    path.lineTo(size.width - edgeRadius, bigRectHeight);
    path.quadraticBezierTo(
        size.width, bigRectHeight, size.width, bigRectHeight - edgeRadius);

    // Top-right of small rectangle
    path.lineTo(size.width, smallRectTop + edgeRadius);
    path.quadraticBezierTo(
        size.width, smallRectTop, size.width - edgeRadius, smallRectTop);

    // Top-left of small rectangle
    path.lineTo(size.width - smallRectWidth + edgeRadius, smallRectTop);
    path.quadraticBezierTo(size.width - smallRectWidth, smallRectTop,
        size.width - smallRectWidth, smallRectTop - edgeRadius);

    // Top-left of big rectangle
    path.lineTo(size.width - smallRectWidth, edgeRadius);
    path.quadraticBezierTo(size.width - smallRectWidth, 0,
        size.width - smallRectWidth - edgeRadius, 0);

    // Continue to top-left
    path.lineTo(edgeRadius, 0);
    path.quadraticBezierTo(0, 0, 0, edgeRadius);

    // Close path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) =>
      oldDelegate.edgeRadius != edgeRadius ||
      oldDelegate.bigRectHeight != bigRectHeight ||
      oldDelegate.smallRectHeight != smallRectHeight ||
      oldDelegate.smallRectWidth != smallRectWidth;
}

class CustomShapeWidget extends StatelessWidget {
  final double edgeRadius;
  final double bigRectHeight;
  final double smallRectHeight;
  final double smallRectWidth;

  const CustomShapeWidget({
    super.key,
    this.edgeRadius = 20.0,
    this.bigRectHeight = 150.0,
    this.smallRectHeight = 75.0,
    this.smallRectWidth = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SvgPicture.asset(
              'assets/vectors/logo.svg',
              width: 180,
              colorFilter: const ColorFilter.mode(limeGreen, BlendMode.srcATop),
            ),
          ),
          CustomPaint(
            size: Size(double.infinity, bigRectHeight),
            painter: CustomShapePainter(
              edgeRadius: edgeRadius,
              bigRectHeight: bigRectHeight,
              smallRectHeight: smallRectHeight,
              smallRectWidth: smallRectWidth,
            ),
          ),
        ],
      ),
    );
  }
}
