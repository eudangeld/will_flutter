import 'package:flutter/material.dart';
import 'package:will_flutter/core/app.dart';
import 'package:will_flutter/injection_container.dart' as di;

//enjoy the silence
void main() {
  di.initDependencies();
  runApp(const App());
}
