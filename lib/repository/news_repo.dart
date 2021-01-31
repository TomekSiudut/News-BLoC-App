import 'package:dio/dio.dart';
import "../models/source_response.dart";
import "../models/article_response.dart";

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2";
  final String apiKey = "0f567cd66fa24375b6beccfe5e0fb84a";

  // http client for dart
  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadLinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};
    try {
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error) {
      print("Something went wrong.");
      return SourceResponse.withError(error);
    }
  }

  Future getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "us"};

    try {
      Response response = await _dio.get(getTopHeadLinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      print("Something went wrong.");
      return ArticleResponse.withError(error);
    }
  }

  Future getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};

    try {
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      print("Something went wrong.");
      return ArticleResponse.withError(error);
    }
  }

  Future getSourceNews(String sourceId) async {
    var params = {"apiKey": apiKey, "sources": sourceId};

    try {
      Response response = await _dio.get(getTopHeadLinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      print("Something went wrong.");
      return ArticleResponse.withError(error);
    }
  }

  Future search(String query) async {
    var params = {"apiKey": apiKey, "q": query};

    try {
      Response response = await _dio.get(getTopHeadLinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      print("Something went wrong.");
      return ArticleResponse.withError(error);
    }
  }
}
