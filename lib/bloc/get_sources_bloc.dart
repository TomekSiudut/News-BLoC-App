import 'package:rxdart/rxdart.dart';
import "../repository/news_repo.dart";

class GetSourcesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject _subject = BehaviorSubject();

  getSources() async {
    final response = await _repository.getSources();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject get subject => _subject;
}

final getSourcesBloc = GetSourcesBloc();
