import "package:flutter/material.dart";
import "../../widgets/headline_slider.dart";
import "../../widgets/top_channels.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadlineSlider(),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Top Channels",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0))),
        TopChannels()
      ],
    );
  }
}
