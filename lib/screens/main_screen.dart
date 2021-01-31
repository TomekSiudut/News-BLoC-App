import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import "package:flutter/material.dart";
import "../bloc/bottom_navbar_bloc.dart";
import "../styles/theme.dart";

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomBloc _bottomBloc;

  @override
  void initState() {
    super.initState();
    _bottomBloc = BottomBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
            backgroundColor: AppColors.mainColor, title: Text("News App", style: TextStyle(color: Colors.white))),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _bottomBloc.itemStream,
          initialData: _bottomBloc.defaultItem,
          builder: (BuildContext context, snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return Container();
              case NavBarItem.SOURCES:
                return Container();
              case NavBarItem.SEARCH:
                return Container();
                break;
              default:
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
          stream: _bottomBloc.itemStream,
          initialData: _bottomBloc.defaultItem,
          builder: (BuildContext context, snapshot) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                    boxShadow: [BoxShadow(color: Colors.grey[100], spreadRadius: 0, blurRadius: 10.0)]),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      iconSize: 20.0,
                      unselectedItemColor: Colors.grey,
                      unselectedFontSize: 9.5,
                      selectedFontSize: 9.5,
                      type: BottomNavigationBarType.fixed,
                      fixedColor: AppColors.mainColor,
                      onTap: _bottomBloc.pickItem,
                      items: [
                        BottomNavigationBarItem(
                            label: "Home", icon: Icon(EvaIcons.homeOutline), activeIcon: Icon(EvaIcons.home)),
                        BottomNavigationBarItem(
                            label: "Sources", icon: Icon(EvaIcons.gridOutline), activeIcon: Icon(EvaIcons.grid)),
                        BottomNavigationBarItem(
                            label: "Search", icon: Icon(EvaIcons.searchOutline), activeIcon: Icon(EvaIcons.search)),
                      ],
                    )));
          }),
    );
  }
}
