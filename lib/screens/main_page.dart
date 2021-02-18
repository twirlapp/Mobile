import 'package:flutter/material.dart';
import 'home_page.dart';
import 'chats_page.dart';
import 'explore_page.dart';
import 'package:twirl/utils/colors.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreenIndex = 0;
  PageController _pageController = PageController();

  final List<Widget> _screens = [HomePage(), ChatsPage(), ExplorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer'),
                decoration: BoxDecoration(color: TwirlColors.TwirlColor),
              )
            ],
          ),
        ),
        body: PageView(
          children: _screens,
          controller: _pageController,
          onPageChanged: _setPage,
          pageSnapping: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 40.0,
                ),
                title: Text('Home'),
                backgroundColor: TwirlColors.TwirlColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer, size: 40.0),
                title: Text('Chats'),
                backgroundColor: TwirlColors.TwirlColor),
            BottomNavigationBarItem(
                icon: RotatedBox(
                    quarterTurns: 1, child: Icon(Icons.explore, size: 40.0)),
                title: Text('Explore'),
                backgroundColor: TwirlColors.TwirlColor)
          ],
          onTap: _setPage,
          currentIndex: _selectedScreenIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          selectedFontSize: 14.0,
          unselectedFontSize: 10.0,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
        ));
  }

  void _setPage(int index) {
    setState(() {
      this._selectedScreenIndex = index;
      this._pageController.animateToPage(index,
          duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
    });
  }
}
