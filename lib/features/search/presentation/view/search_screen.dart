import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zagel/features/home/presentation/view_model_or_maneger/news_cubit.dart';
import 'package:zagel/features/search/presentation/widgets/news_listview_by_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Write somthing to search",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 0.5),
                      child: FloatingActionButton.small(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          context
                              .read<NewsCubit>()
                              .getNewsBySearch(searchController.text);
                        },
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                const Expanded(child: NewsListBySearchWidget())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
