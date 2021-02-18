import 'package:flutter/material.dart';
import 'package:twirl/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextDirection _direction = TextDirection.ltr;
  ScrollController _postScrollController = new ScrollController(initialScrollOffset: 0);
  FocusNode _searchFocusNode = FocusNode();
  List<Widget> _posts =
      List.generate(60, (int index) => Card(child: Text(index.toString())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: GestureDetector(
          onTap: () => _searchFocusNode.unfocus(),
          onHorizontalDragStart: (_) => _searchFocusNode.unfocus(),
          onVerticalDragDown: (_) => _searchFocusNode.unfocus(),
          child: CustomScrollView(
            controller: _postScrollController,
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                primary: false,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                expandedHeight: 12.0,
                title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      textDirection: _direction,
                      cursorColor: TwirlColors.TwirlDarkColor,
                      cursorWidth: 1.0,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: TwirlColors.TwirlDarkColor,
                        ),
                        hintText: 'Search for anything',
                        hintStyle: TextStyle(color: Colors.black38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32.0))
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    )
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext ctx, int index) {
                      if (index < _posts.length) {
                        return _posts.elementAt(index);
                      }
                    }
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
