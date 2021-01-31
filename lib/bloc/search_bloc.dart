import 'package:rxdart/rxdart.dart';
import "../models/article_response.dart";
import "../repository/news_repo.dart";

class SearchBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject _subject = BehaviorSubject();

  search(String query) async {
    ArticleResponse response = await _repository.search(query);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final searchBloc = SearchBloc();
