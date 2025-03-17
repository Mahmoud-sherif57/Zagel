import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_cubit.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_state.dart';

class SourceScreen extends StatelessWidget {
  const SourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getSourcesOfNews();
    return SafeArea(
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is SourceNewsSuccess) {
            final source = state.sourceModel.sources;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scaffold(
                body: Center(
                    child: ListView.separated(
                  shrinkWrap: true,

                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: source.length,
                  // gridDelegate:
                  //     const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         crossAxisSpacing: 10,
                  //         mainAxisSpacing: 10),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () async {
                      var url = Uri.parse(source[index].url ?? "");
                      await launchUrl(url);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backGround),
                      padding: const EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              source[index].name ?? "",
                              style: getBodyStyle(context),
                            ),
                            const Gap(10),
                            Text(
                              source[index].description ?? "",
                              style: getSmallStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
              ),
            );
          } else if (state is SourceNewsError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
