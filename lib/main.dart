import 'package:flutter/material.dart';
import 'package:images_picker/image/select_image.dart';
import 'package:images_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PickerScreen(),
    );
  }
}
