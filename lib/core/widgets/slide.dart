import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:zagel/core/functions/routing.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/features/home/presentation/view/home_screen.dart';

class SlideToActWidget extends StatelessWidget {
  const SlideToActWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final GlobalKey<SlideActionState> key = GlobalKey();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SlideAction(
            text: "Go To Home",
            textColor: Colors.black,
            innerColor: Colors.black,
            outerColor: AppColors.primary,
            sliderButtonIcon: const Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
            ),
            key: key,
            onSubmit: () {
              Future.delayed(
                const Duration(seconds: 1),
                () => key.currentState!.reset(),
              );

              return AppRouting.navigateTo(const HomeScreen(), context);
            },
          ),
        );
      },
    );
  }
}
