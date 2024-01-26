// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_element

import "package:flutter/material.dart";
import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = ['Moscow', 'Japan', 'Delhi', 'London'];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('../../assets/images/logo_discover.png'),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black87,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(_context).size.height * 0.05,
            bottom: MediaQuery.of(_context).size.height * 0.05,
          ),
          child: _locationBar(_context),
        ),
        _articlesList(_context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map(
          (l) {
            bool _isActive = _locations[_activeLocation] == l ? true : false;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  l,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: _isActive ? Colors.white : Colors.white54,
                  ),
                ),
                _isActive
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                        ),
                        height: 5,
                        width: 50,
                      )
                    : Container(),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _articlesList(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * 0.05,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(articles[index].image),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 3,
                        blurRadius: 20,
                        offset: Offset(0, 6),
                      ),
                    ]),
                child: _articleInfoColumn(context, index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _articleInfoColumn(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 30, 0),
          child: _authorInfoRow(_context, _index),
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('../../assets/images/avatar.jpg'),
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles[_index].author,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "3 hrs ago",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 23,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 23,
              ),
            )
          ],
        ),
      ],
    );
  }
}
