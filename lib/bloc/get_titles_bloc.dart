import 'dart:async';
import 'package:news/models/article_response.dart';
import "../repository/news_repo.dart";

class TitlesBloc {
  final NewsRepository _repository = NewsRepository();
  final StreamController _titleStreamController = StreamController();

  StreamSink get titleSink => _titleStreamController.sink;
  Stream get titleStream => _titleStreamController.stream;

  void getTitles() async {
    ArticleResponse response = await _repository.getTopHeadlines();
    titleSink.add(response);
  }

  void dispose() {
    _titleStreamController.close();
  }
}
