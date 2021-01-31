import 'dart:async';

enum NavBarItem { HOME, SOURCES, SEARCH }

class BottomBloc {
  final StreamController<NavBarItem> _navbarController = StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  StreamSink<NavBarItem> get itemSink => _navbarController.sink;
  Stream<NavBarItem> get itemStream => _navbarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        itemSink.add(NavBarItem.HOME);
        break;
      case 1:
        itemSink.add(NavBarItem.SOURCES);
        break;
      case 2:
        itemSink.add(NavBarItem.SEARCH);
        break;
      default:
    }
  }

  close() {
    _navbarController?.close();
  }
}
