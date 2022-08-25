import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BaseScrollConfig extends StatelessWidget {
  final ListView listBuilder;
  const BaseScrollConfig(this.listBuilder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      child: listBuilder,
    );
  }
}
