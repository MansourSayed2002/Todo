import 'package:flutter/material.dart';
import 'package:todo/Core/services/Myservices.dart';
import 'package:todo/Todo_App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservices();
  runApp(const ToDoApp());
}
