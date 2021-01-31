import 'package:rxdart/rxdart.dart';

import "../repository/news_repo.dart";
import "../models/article_response.dart";

class TopHeadlinesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<ArticleResponse>();

  getHeadlines() async {
    ArticleResponse response = await _repository.getTopHeadlines();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getTopHeadlinesBloc = TopHeadlinesBloc();
