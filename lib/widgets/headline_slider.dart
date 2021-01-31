import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import "../bloc/get_top_headlines.dart";
import "../elements/error_element.dart";
import "../elements/loader.dart";
import "../models/article.dart";
import "package:timeago/timeago.dart" as timeago;

class HeadlineSlider extends StatefulWidget {
  HeadlineSlider({Key key}) : super(key: key);

  @override
  _HeadlineSliderState createState() => _HeadlineSliderState();
}

class _HeadlineSliderState extends State<HeadlineSlider> {
  @override
  void initState() {
    super.initState();
    getTopHeadlinesBloc.getHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getTopHeadlinesBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildSlider(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.data.error);
          } else {
            return buildLoading();
          }
        });
  }

  Widget _buildSlider(data) {
    List<Article> articles = data.articles;

    return Container(
        child: CarouselSlider(
            options: CarouselOptions(enlargeCenterPage: false, height: 200.0, viewportFraction: 0.9),
            items: getExpenseSliders(articles)));
  }

  getExpenseSliders(List<Article> articles) {
    return articles.map((article) {
      return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: article.img == null ? NetworkImage("") : NetworkImage(article.img)))),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.9), Colors.white.withOpacity(0.0)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.1, 0.9]))),
                Positioned(
                    bottom: 30.0,
                    child: Container(
                        width: 250.0,
                        padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(article.title,
                                style: TextStyle(
                                    height: 1.5, color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0))
                          ],
                        ))),
                Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    child: Text(article.source.name, style: TextStyle(color: Colors.white54, fontSize: 9.0))),
              ],
            ),
          ));
    }).toList();
  }

  String timeAgo(date) {
    return timeago.format(date);
  }
}
