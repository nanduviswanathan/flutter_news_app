import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/constants/colors.dart';
import 'package:news_app/shared/helper/app_images.dart';
import 'package:news_app/viewmodel/home_provider.dart';
import 'package:provider/provider.dart';

import '../../model/news_article_model.dart';
import '../../services/firebase_remote_config_service.dart';
import '../../shared/constants/constants.dart';
import '../../shared/helper/utility.dart';
import '../widgets/custom_text_types.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final remoteConfig = FirebaseRemoteConfigService();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: false,
          title: const TextBoldW700(
            text: Constants.myNewsText,
            textColor: Colors.white,
            fontSize: 14,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.near_me,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  TextBoldW700(
                    text: remoteConfig.countryCode,
                    textColor: Colors.white,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: kPrimaryColor, // App bar background color
          elevation: 0, // No shadow
        ),
        backgroundColor: kBackgroundColor,
        body: FutureBuilder<NewsArticle>(
          future: homeProvider.fetchNewsByCountry(
            remoteConfig.countryCode,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.totalResults == 0) {
              return const Center(child: Text('No news found.'));
            }

            final newsList = snapshot.data!;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const TextBoldW700(
                    text: Constants.topHeadLineText,
                    fontSize: 14,
                    textColor: kBlackColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsList.articles.length,
                      itemBuilder: (context, index) {
                        final news = newsList.articles[index];
                        return
                            // MyCardWidget();
                            Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            BreakingNewsTile(news: news),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

class BreakingNews {
  final String source;
  final String headline;
  final String time;

  BreakingNews(
      {required this.source, required this.headline, required this.time});
}

class BreakingNewsTile extends StatelessWidget {
  final Article news;

  const BreakingNewsTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the Container
        borderRadius:
            BorderRadius.circular(10), // Rounded corners with radius 10
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    news.source.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  news.description ?? news.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  Utility.getDifferenceBetweenTime(news.publishedAt),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Add some spacing between text and image
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: news.urlToImage != null
                  ? CachedNetworkImage(
                      imageUrl: news.urlToImage!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image.asset(
                      AppImages.breakingNewsImage,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
