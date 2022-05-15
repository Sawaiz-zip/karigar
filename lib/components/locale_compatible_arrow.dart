import 'package:flutter/material.dart';
import 'package:karigar/utils/assets.dart';

enum ArrowDirection { forward, backward }

class LocaleCompatibleArrow extends StatelessWidget {
  final ArrowDirection arrowDirection;
  final double width;
  final double height;
  final String imagePath;
  final bool isLongArrow;
  final bool isWhiteArrow;

  const LocaleCompatibleArrow({
    Key? key,
    this.arrowDirection = ArrowDirection.backward,
    this.width = 16,
    this.height = 16,
    this.imagePath = '',
    this.isLongArrow = false,
    this.isWhiteArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int quarterTurns = 0;
    if (arrowDirection == ArrowDirection.forward) {
      quarterTurns += 2;
    }
    if (isLongArrow) {
      quarterTurns -= 2;
    }

    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Image.asset(
        imagePath != Assets.icBackBlack
            ? imagePath
            : isLongArrow
                ? Assets.icForwardArrowBlack
                : isWhiteArrow
                    ? Assets.icBackWhite
                    : Assets.icBackBlack,
        width: width,
        height: height,
      ),
    );
  }
}
