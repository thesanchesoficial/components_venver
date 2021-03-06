import 'package:flutter/material.dart';

class OwBoxProgressBar extends StatelessWidget {
  final int quantity;
  final int quantityFilled;
  final double spaceBetween;
  final double height;
  final double radius;
  final Color progressColor;
  final Color barColor;
  final Animation<Color> colorAnimationLinearProgress;
  final bool animated;

  const OwBoxProgressBar({
    Key key,
    this.quantity = 1,
    this.quantityFilled = 0,
    this.spaceBetween,
    this.radius = 10,
    this.progressColor = Colors.red, // ! Change
    this.barColor = Colors.grey,
    this.height = 10,
    this.colorAnimationLinearProgress,
    this.animated = true,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: _progressBarList(context),
      ),
    );
  }

  List<Widget> _progressBarList(BuildContext context) {
    List<Widget> _progressBars = [];
    double _spaceBetween = spaceBetween ?? height / 2;
    for(int i = 0; i < quantity; i++) {
      _progressBars.add(Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          child: Container(
            height: height,
            color: i < quantityFilled
              ? progressColor
              : i > quantityFilled || !animated
                ? barColor ?? progressColor.withOpacity(.4)
                : Colors.transparent,
            child: i == quantityFilled && animated
              ? LinearProgressIndicator(
                backgroundColor: barColor ?? progressColor.withOpacity(.4),
                valueColor: colorAnimationLinearProgress ?? AlwaysStoppedAnimation<Color>(
                  progressColor,
                ),
              )
              : const SizedBox(),
          ),
        ),
      ));

      if(i < quantity - 1) {
        _progressBars.add(
          SizedBox(width: _spaceBetween),
        );
      }
    }

    return _progressBars;
  }
}
