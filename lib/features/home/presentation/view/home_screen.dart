import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zagel/core/constants/app_images.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/features/home/presentation/widgets/home_header_widget.dart';
import 'package:zagel/features/home/presentation/widgets/news_listview_by_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> carouselImages = [
  AppImages.slider1,
  AppImages.slider2,
  AppImages.slider3,
  AppImages.slider1,
  AppImages.slider4,
  AppImages.slider4,
  AppImages.slider4,
  AppImages.slider4,
];

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // context.read<NewsCubit>().getHeadLineNews;
    return SafeArea(
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HomeHeaderWidget(),
                const Gap(15),
                // the carousel slider section.
                CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(carouselImages[index]);
                    // return Image.network(headLineNews[5].urlToImage ?? "",
                    //     errorBuilder: (context, error, stackTrace) {
                    //   return const SizedBox(
                    //     width: 150,
                    //     child: Icon(
                    //       Icons.error,
                    //       color: AppColors.primary,
                    //     ),
                    //   );
                    // });
                  },
                  itemCount: 5,
                  // itemCount: headLineNews.length,
                  options: CarouselOptions(
                    height: 150,
                    // aspectRatio: 16 / 9,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentSlider = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                // BlocBuilder<NewsCubit, NewsState>(
                //   builder: (context, state) {
                //     if (state is HeadLineNewsSuccess) {
                //       log("message");
                //       var headLineNews = state.newsModel.articles!;
                //       return CarouselSlider.builder(
                //         itemBuilder: (context, index, realIndex) {
                //           return Image.asset(carouselImages[index]);
                //           // return Image.network(headLineNews[5].urlToImage ?? "",
                //           //     errorBuilder: (context, error, stackTrace) {
                //           //   return const SizedBox(
                //           //     width: 150,
                //           //     child: Icon(
                //           //       Icons.error,
                //           //       color: AppColors.primary,
                //           //     ),
                //           //   );
                //           // });
                //         },
                //         itemCount: 5,
                //         // itemCount: headLineNews.length,
                //         options: CarouselOptions(
                //           height: 150,
                //           // aspectRatio: 16 / 9,
                //           viewportFraction: 0.7,
                //           initialPage: 0,
                //           enableInfiniteScroll: true,
                //           reverse: false,
                //           autoPlay: true,
                //           autoPlayInterval: const Duration(seconds: 3),
                //           autoPlayAnimationDuration:
                //               const Duration(milliseconds: 800),
                //           autoPlayCurve: Curves.fastOutSlowIn,
                //           enlargeCenterPage: true,
                //           enlargeFactor: 0.3,
                //           onPageChanged: (index, reason) {
                //             setState(() {
                //               currentSlider = index;
                //             });
                //           },
                //           scrollDirection: Axis.horizontal,
                //         ),
                //       );
                //     } else if (state is HeadLineNewsError) {
                //       return const Text("error");
                //     } else {
                //       log("loooooding");
                //       return const CircularProgressIndicator();
                //     }
                //   },
                // ),
                const Gap(10),
                // the page indicator section.
                MySmoothPageIndicator(currentSlider: currentSlider),
                const Gap(15),

                const MyButtonsTapBar(),
                const Gap(10),
                const Expanded(
                  child: TabBarView(children: [
                    NewsListViewWidget(
                      category: "general",
                    ),
                    NewsListViewWidget(
                      category: "Egypt",
                    ),
                    NewsListViewWidget(
                      category: "gaza",
                    ),
                    NewsListViewWidget(
                      category: "middle-east",
                    ),
                    NewsListViewWidget(
                      category: "syria",
                    ),
                    NewsListViewWidget(
                      category: "health",
                    ),
                    NewsListViewWidget(
                      category: "science",
                    ),
                    NewsListViewWidget(
                      category: "technology",
                    ),
                    NewsListViewWidget(
                      category: "business",
                    ),
                    NewsListViewWidget(
                      category: "sports",
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySmoothPageIndicator extends StatelessWidget {
  const MySmoothPageIndicator({
    super.key,
    required this.currentSlider,
  });

  final int currentSlider;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: PageController(
        initialPage: currentSlider,
      ),
      // count: 6,
      count: carouselImages.length,
      effect: const ScrollingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        dotColor: AppColors.grey,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}

class MyButtonsTapBar extends StatelessWidget {
  const MyButtonsTapBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      splashColor: AppColors.white,
      height: 35,
      buttonMargin: const EdgeInsets.symmetric(horizontal: 8),
      backgroundColor: AppColors.primary,
      labelStyle: getTitleStyle(context, color: AppColors.black),
      unselectedLabelStyle: getSmallStyle(color: AppColors.white),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      unselectedBackgroundColor: AppColors.containerBG,
      tabs: const [
        Tab(
          text: "General",
        ),
        Tab(
          text: "Egypt",
        ),
        Tab(
          text: "Gaza",
        ),
        Tab(
          text: "Middle East",
        ),
        Tab(
          text: "Syria",
        ),
        Tab(
          text: "Health",
        ),
        Tab(
          text: "Science",
        ),
        Tab(
          text: "Technology",
        ),
        Tab(
          text: "Business",
        ),
        Tab(
          text: "Sports",
        ),
      ],
    );
  }
}
