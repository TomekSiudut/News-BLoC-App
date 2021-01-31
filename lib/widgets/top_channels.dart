import "package:flutter/material.dart";
import "../bloc/get_sources_bloc.dart";
import "../elements/error_element.dart";
import "../elements/loader.dart";

class TopChannels extends StatefulWidget {
  TopChannels({Key key}) : super(key: key);

  @override
  _TopChannelsState createState() => _TopChannelsState();
}

class _TopChannelsState extends State<TopChannels> {
  @override
  void initState() {
    super.initState();
    getSourcesBloc..getSources();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getSourcesBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildTopChannels(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.data.error);
          } else {
            return buildLoading();
          }
        });
  }

  Widget _buildTopChannels(data) {
    List sources = data.sources;

    if (sources.length == 0) {
      return Container(
          child: Column(
        children: <Widget>[Text("No Sources")],
      ));
    } else {
      return Container(
          height: 115.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sources.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: 80.0,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                        Hero(
                            tag: sources[index].toString(),
                            child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(1.0, 1.0))
                                    ],
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://adnas.com/wp-content/uploads/2019/08/fox-news-logo.jpg"))))),
                        SizedBox(height: 10.0),
                        Text("Fox News",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.4, color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10.0)),
                        Text("Breaking News",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.4, color: Colors.grey, fontSize: 8.0))
                      ])));
            },
          ));
    }
  }
}
