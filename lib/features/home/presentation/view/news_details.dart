import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/core/widgets/custom_button.dart';
import 'package:zagel/features/home/model/news_model/article.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(article.urlToImage ?? ""),
                ),
              const Gap(10),
              Text(
                article.title ?? "",
                style: getTitleStyle(context),
              ),
              const Gap(10),
              Row(
                children: [
                  Text(
                    article.author ?? "",
                    style: getSmallStyle(),
                  ),
                  const Spacer(),
                  Text(article.publishedAt.toString().split("T")[0])
                ],
              ),
              const Gap(10),
              Text(
                article.description ?? "",
                style: getBodyStyle(context),
              ),
              // const Gap(10),
              // Text(
              //   article.content ?? "",
              //   style: getBodyStyle(context),
              // ),
              const Gap(10),
              Text(
                "Source: ${article.source!.name ?? ""}",
                style: getBodyStyle(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButtonWidget(
          text: "Go To Website",
          onPressed: () async {
            var url = Uri.parse(article.url ?? "");
            await launchUrl(url);
          },
        ),
      ),
    );
  }
}
