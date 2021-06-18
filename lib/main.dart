import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_page/controller.dart';
import 'package:setting_page/features_page.dart';
import 'package:setting_page/setting_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Controller(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Controller _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: _controller.settingScreenFlag == false
            ? _controller.featureScreenFlag == false
                ? HomePage()
                : FeaturesScreen()
            : SettingScreen());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "POS",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: HomeWidget(controller: _controller),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
    @required Controller controller,
  })  : _controller = controller,
        super(key: key);

  final Controller _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _controller.changeSettingFlag();
              },
              child: Text("Settings")),
          ElevatedButton(
              onPressed: () {
                _controller.changeFeatureFlag();
              },
              child: Text("Features")),
        ],
      ),
    );
  }
}
