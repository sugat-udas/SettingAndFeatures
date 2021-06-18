import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_page/controller.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Controller _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _controller.changeSettingFlag();
          },
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          SettingList(
            title: "System Settings",
            displayList: _controller.systemSettingList,
          ),
          SettingList(
            title: "POS Settings",
            displayList: _controller.posSettingList,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingList extends StatelessWidget {
  String title;
  List displayList;
  SettingList({@required this.title, @required this.displayList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder(
            bottom: BorderSide(color: Colors.grey[400]),
            horizontalInside: BorderSide(color: Colors.grey[400])),
        children: [
          TableRow(children: [
            TableCell(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 20.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ]),
          for (var item in displayList)
            TableRow(
              children: [
                TableCell(child: _textMaker(item)),
              ],
            ),
        ],
      ),
    );
  }
}

Widget _textMaker(String text) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 25.0, right: 25.0, top: 16.0, bottom: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: 16.0,
        )
      ],
    ),
  );
}
