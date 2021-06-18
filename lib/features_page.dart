import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_page/controller.dart';

// ignore: must_be_immutable
class FeaturesScreen extends StatelessWidget {
  Controller _controller;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Features",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _controller.changeFeatureFlag();
          },
          color: Colors.black,
        ),
      ),
      body: FeaturesBody(),
    );
  }
}

// ignore: must_be_immutable
class FeaturesBody extends StatelessWidget {
  Controller _controller;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    return ListView.builder(
        itemCount: ItemList.itemList.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(
              ItemList.itemList[index].title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              ItemList.itemList[index].subtitle,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            trailing: CupertinoSwitch(
              trackColor: Colors.black,
              value: ItemList.itemList[index].isOn,
              onChanged: (val) {
                _controller.changeSwitchValue(index);
              },
            ),
          );
        });
  }
}
