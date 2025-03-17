import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zagel/core/constants/app_images.dart';
import 'package:zagel/core/functions/routing.dart';
import 'package:zagel/core/services/cach_keys.dart';
import 'package:zagel/core/services/locale_storage.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/core/widgets/custom_neumorphic_container.dart';
import 'package:zagel/features/upload/upload_view.dart';
import 'package:zagel/features/wrapper_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    final isUpload = AppLocaleStorage.getCachData(CachKeys.isUpload) ?? false;

    Future.delayed(
      const Duration(seconds: 4),
      () {
        AppRouting.navigateAndRemove(
            isUpload ? const WrapperWidget() : const UploadView(), context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: CustomNeumorphicContainer(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo),
              const Gap(25),
              Text("ZAGEL",
                  style: getBodyStyle(
                    context,
                    color: AppColors.primary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
