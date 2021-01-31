import "./source.dart";

class SourceResponse {
  final List<Source> sources;
  final String error;

  SourceResponse({this.sources, this.error});

  SourceResponse.fromJson(Map<String, dynamic> json)
      : sources = (json["sources"] as List).map((i) => Source.fromJson(i)).toList(),
        error = "";

  SourceResponse.withError(String errorValue)
      : sources = List(),
        error = errorValue;
}
