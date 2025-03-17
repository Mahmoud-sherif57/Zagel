import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zagel/core/constants/app_images.dart';
import 'package:zagel/core/services/cach_keys.dart';
import 'package:zagel/core/services/locale_storage.dart';
import 'package:zagel/core/utils/colors.dart';

import '../../../../core/utils/text_style.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String imagePath = "";
  String userName = "";

  @override
  void initState() {
    super.initState();
    userName = AppLocaleStorage.getCachData(CachKeys.name) ?? "";
    imagePath = AppLocaleStorage.getCachData(CachKeys.image) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${userName.isNotEmpty ? userName.split(" ").first : "User"}",
                style: getTitleStyle(context,
                    color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              Text(
                "Have a Nice Day",
                style: getSmallStyle(context: context, fontSize: 16),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            // AppRouting.navigateTo(const ProfileView(), context);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: imagePath.isNotEmpty
                ? FileImage(File(imagePath)) as ImageProvider
                : const AssetImage(AppImages.user),
          ),
        ),
      ],
    );
  }
}
