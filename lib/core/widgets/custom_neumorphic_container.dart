// ignore: file_names
import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

/*
i downloaded this component from "https://fluttercomponentlibrary.com" "animatedShadowButton"
and i gave the child from out side to be able to wrab any widget with this widget and give it required padding .
*/
class CustomNeumorphicContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomNeumorphicContainer(
      {super.key, required this.child, required this.padding});

  @override
  State<CustomNeumorphicContainer> createState() =>
      _CustomNeumorphicContainerState();
}

class _CustomNeumorphicContainerState extends State<CustomNeumorphicContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> tween;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    tween = Tween<double>(begin: 0, end: 359);
    animation = controller.drive(tween);

    controller.forward();
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: widget.padding,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                // fixedSize: const Size(100, 50),
                shape: DecoratedOutlinedBorder(
                  shadow: [
                    GradientShadow(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: _generateGradientColors(animation.value),
                          stops: _generateGradientStops(),
                        ),
                        offset: const Offset(0, 0),
                        blurRadius: 12,
                        spreadRadius: 1)
                  ],
                  child: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }

  List<Color> _generateGradientColors(double offset) {
    List<Color> colors = [];
    const int divisions = 10;
    for (int i = 0; i < divisions; i++) {
      double hue = (360 / divisions) * i;
      hue += offset;
      if (hue > 360) {
        hue -= 360;
      }
      final Color color = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor();
      colors.add(color);
    }
    colors.add(colors[0]);
    return colors;
  }

  List<double> _generateGradientStops() {
    const int divisions = 10;
    List<double> stops = [];
    for (int i = 0; i <= divisions; i++) {
      stops.add(i / divisions);
    }
    return stops;
  }
}
