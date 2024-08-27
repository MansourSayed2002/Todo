import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskaddModel {
  String title;
  IconData icon;
  VoidCallback ontap;

  TaskaddModel({
    required this.icon,
    required this.ontap,
    required this.title,
  });
}
