import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    "icons": const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    "color": Colors.yellow[700],
    "name": "Food",
    "totalAmount": "-Rs.2500.00",
    "date": "Today",
  },
  {
    "icons": const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    "color": Colors.purple,
    "name": "Shopping",
    "totalAmount": "-Rs.9500.00",
    "date": "Today",
  },
  {
    "icons": const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    "color": Colors.green,
    "name": "Health",
    "totalAmount": "-Rs.3500.00",
    "date": "Yesterday",
  },
  {
    "icons": const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    "color": Colors.blue,
    "name": "Travel",
    "totalAmount": "-Rs.12000.00",
    "date": "Yesterday",
  },
];
