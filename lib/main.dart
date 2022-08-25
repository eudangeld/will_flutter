import 'package:flutter/material.dart';
import 'package:will_flutter/core/app.dart';
import 'package:will_flutter/di_container.dart' as di;

//enjoy the silence
void main() {
  di.initDependencies();
  runApp(App());
}
