import 'package:flutter/material.dart';
import 'package:news_app/repository/api_repository.dart';
import 'package:news_app/shared/helper/utility.dart';

import '../model/news_article_model.dart';
import '../shared/constants/constants.dart';

class HomeProvider with ChangeNotifier {
  ApiRepository apiService = ApiRepository();

  Future<NewsArticle> fetchNewsByCountry(String country) async {
    var queryParams = {
      Constants.countryText: country,
      Constants.apiKeyText: Utility.getNewsApi(),
    };
    final response = await apiService.get(
        endPoint: Constants.newsEndpoint, queryParameters: queryParams);

    if (response["status"] == 'ok') {
      return NewsArticle.fromJson(response);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
