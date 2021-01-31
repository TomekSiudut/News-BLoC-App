import 'package:rxdart/rxdart.dart';
import "../repository/news_repo.dart";
import "../models/article_response.dart";

class GetHotNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<ArticleResponse>();

  void getHotNews() async {
    ArticleResponse response = await _repository.getHotNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getHotNewsBloc = GetHotNewsBloc();
