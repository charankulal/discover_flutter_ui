// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_element, avoid_unnecessary_containers, sized_box_for_whitespace

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
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Padding(
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
              ),
              Positioned(
                bottom: 5,
                left: MediaQuery.of(_context).size.width * 0.10,
                child: _socialInfoContainer(context, index),
              ),
            ],
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
        Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(_context).size.height * 0.05, 30, 0),
          child: _detailInfoRow(_context, _index),
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

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(_context).size.width * 0.50,
                child: Text(
                  articles[_index].title,
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 3,bottom: 3),
              child: Text(
                articles[_index].location,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                ),
              ),),
              _ratingWidget(_context, _index),
            ],
          ),
        )
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.08,
      width: MediaQuery.of(_context).size.width * 0.70,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 211, 209, 209),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.mode_comment,
                color: Colors.black,
              ),
              Text(
                articles[_index].comments.toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.black,
              ),
              Text(
                articles[_index].shares.toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
      children: List<Widget>.generate(
        5,
        (_currentIndex) {
          double _fillAmount = articles[_index].rating - _currentIndex;
          Icon _starIcon;
          if (_fillAmount >= 1) {
            _starIcon = Icon(
              Icons.star,
              color: Colors.amberAccent,
              size: 18,
            );
          } else if (_fillAmount >= 0.5) {
            _starIcon = Icon(
              Icons.star_half,
              color: Colors.amberAccent,
              size: 18,
            );
          } else {
            _starIcon = Icon(
              Icons.star_border,
              color: Colors.amberAccent,
              size: 18,
            );
          }
          return _starIcon;
        },
      ),
    );
  }
}
