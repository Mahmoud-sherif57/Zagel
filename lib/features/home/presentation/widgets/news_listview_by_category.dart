import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zagel/core/functions/routing.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/features/home/presentation/view/news_details.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_cubit.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_state.dart';

class NewsListViewWidget extends StatelessWidget {
  const NewsListViewWidget({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewsByCategory(category);
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsByCategorySuccess) {
          var news = state.newsModel.articles;
          return ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  AppRouting.navigateTo(
                      NewsDetailsScreen(
                        article: news[index],
                      ),
                      context);
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.containerBG),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(news[index].urlToImage ?? "",
                            width: 150, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            width: 150,
                            child: Icon(
                              Icons.error,
                              color: AppColors.primary,
                            ),
                          );
                        }),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Title of news
                            Text(
                              news[index].title ?? "FREE PALESTINE",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(context, fontSize: 14),
                            ),
                            const Gap(10),
                            //name of the auther
                            if (news[index].author != null)
                              Text(
                                "Auther: ${news[index].author} ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getBodyStyle(context, fontSize: 8),
                              ),
                            const Gap(10),
                            const Row(
                              children: [
                                Icon(
                                  Icons.library_books_outlined,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                                Gap(10),
                                Text("Read")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: news!.length,
          );
        } else if (state is NewsByCategoryError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
