import 'package:flutter/material.dart';

class ProgressIndicator extends StatelessWidget {
  final double percentage;
  final Color dotColor;
  final Color backgroundColor;
  final double height;
  final double width;
  final Color color;
  final bool dot;
  final bool animate;
  final int animationTime;

  const ProgressIndicator(
      {Key key,
        this.percentage = 0,
        this.backgroundColor,
        this.dotColor = Colors.white,
        @required this.height,
        @required this.width,
        this.color = Colors.purple,
        this.dot = false,
        this.animate = false,
        this.animationTime = 1500})
      : super(key: key);

  BoxDecoration _getDecoration(int layer) {
    if (this.backgroundColor == null) {
      return BoxDecoration(
          color: this.color.withOpacity(layer == 0 ? 0.3 : 1),
          borderRadius: BorderRadius.circular(50));
    } else {
      return BoxDecoration(
          color: layer != 0 ? this.color : this.backgroundColor,
          borderRadius: BorderRadius.circular(50));
    }
  }

  Alignment _calculateAlignment() {
    if (height > width) {
      return Alignment.bottomCenter;
    } else {
      return Alignment.centerLeft;
    }
  }

  double _calculateHeight() {
    if (height > width) {
      return (this.height / 100) * this.percentage;
    } else {
      return height;
    }
  }

  double _calculateWidth() {
    if (height > width) {
      return width;
    } else {
      return (this.width / 100) * this.percentage;
    }
  }

  double _dotSize() {
    if (this.percentage < 10) {
      return 0;
    }
    if (height > width) {
      return width * 0.6;
    } else {
      return height * 0.6;
    }
  }

  EdgeInsetsGeometry _getDotMargin() {
    if (height > width) {
      double margin = ((this.height / 100) * this.percentage) - _dotSize() - 2;
      return EdgeInsets.only(bottom: margin >= 0 ? margin : 0);
    } else {
      double margin = ((this.width / 100) * this.percentage) - _dotSize() - 2;
      return EdgeInsets.only(left: margin >= 0 ? margin : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _calculateAlignment(),
      children: <Widget>[
        Container(
          height: this.height,
          width: this.width,
          decoration: _getDecoration(0),
        ),
        Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            AnimatedContainer(
              duration:
              Duration(milliseconds: this.animate ? this.animationTime : 0),
              height: _calculateHeight(),
              width: _calculateWidth(),
              decoration: _getDecoration(1),
            ),
            AnimatedContainer(
              duration:
              Duration(milliseconds: this.animate ? this.animationTime : 0),
              height: _dotSize(),
              width: _dotSize(),
              margin: _getDotMargin(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: this.dot ? this.dotColor : Colors.transparent,
              ),
            )
          ],
        )
      ],
    );
  }
}
