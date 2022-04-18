import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Filter screen'),
      ),
    );
  }
}
