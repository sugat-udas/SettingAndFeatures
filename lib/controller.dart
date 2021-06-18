import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool settingScreenFlag = false;
  bool featureScreenFlag = false;
  bool switchValue = true;

  changeSwitchValue(int index) {
    ItemList.itemList[index].isOn = !ItemList.itemList[index].isOn;
    notifyListeners();
  }

  changeSettingFlag() {
    settingScreenFlag = !settingScreenFlag;
    notifyListeners();
  }

  changeFeatureFlag() {
    featureScreenFlag = !featureScreenFlag;
    notifyListeners();
  }

  List systemSettingList = [
    "Features",
    "Billing & Subscription",
    "Payment",
    "Loyalty",
    "Taxes",
    "Receipt",
    "Dining Option"
  ];

  List posSettingList = ["Stores", "POS Devices"];
}

class ItemList {
  String title;
  String subtitle;
  bool isOn;

  ItemList({this.title, this.subtitle, this.isOn});

  static final itemList = [
    ItemList(
      title: "Shifts",
      subtitle: "Track cash that goes in and out of your drawer",
      isOn: false,
    ),
    ItemList(
      title: "Time clock",
      subtitle:
          "Track employee' clock in/out time and calculate total work hours",
      isOn: false,
    ),
    ItemList(
      title: "Open tickets",
      subtitle: "Allow to save and edit orders before completing a payment",
      isOn: false,
    ),
    ItemList(
      title: "Kitchen printers",
      subtitle: "Send orders to kitchen printer or display",
      isOn: false,
    ),
    ItemList(
      title: "Customer display",
      subtitle:
          "Display order information to customers at the time of purchase",
      isOn: false,
    ),
    ItemList(
      title: "Dining option",
      subtitle: "Mark orders as dine in takeaway or for delivery",
      isOn: false,
    ),
    ItemList(
      title: "Low stock notification",
      subtitle: "Get daily email on items that are low or out of stock",
      isOn: false,
    ),
    ItemList(
      title: "Negative stock alert",
      subtitle: "Warn cashiers attempting to sell more inventory",
      isOn: false,
    ),
  ];
}
