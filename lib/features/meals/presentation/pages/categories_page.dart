import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The meal App'),
        ),
        // floatingActionButton: InkWell(onTap: ()async => ,),
        body: const Center(child: Text('Hello world')));
  }
}
