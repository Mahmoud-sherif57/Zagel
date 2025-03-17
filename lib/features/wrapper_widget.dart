import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zagel/core/constants/app_images.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/features/home/presentation/view/home_screen.dart';
import 'package:zagel/features/profile/presentation/view/profile_screen.dart';
import 'package:zagel/features/search/presentation/view/search_screen.dart';
import 'package:zagel/features/source/presentation/view/source_screen.dart';

class WrapperWidget extends StatefulWidget {
  const WrapperWidget({super.key});

  @override
  State<WrapperWidget> createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
    const SourceScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.home,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                AppImages.home,
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.search,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                AppImages.search,
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: 25,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.profile,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                AppImages.profile,
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: 25,
              ),
              label: "Profile"),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImages.folder,
                height: 30,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(
                AppImages.folder,
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: 25,
              ),
              label: "Source"),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
