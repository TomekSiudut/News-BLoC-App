import 'package:rxdart/rxdart.dart';
import "../repository/news_repo.dart";
import "../models/article_response.dart";

class GetSourceBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<ArticleResponse>();

  getSourceNews(String sourceId) async {
    ArticleResponse response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getSourceNewsBloc = GetSourceBloc();
