import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/Data/source/local/Sqflite.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              sqlDb.deletedatabases();
            },
            child: const Text('data')),
      ),
    );
  }
}
