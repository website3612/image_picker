import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PickerScreen extends StatefulWidget {
  @override
  _PickerScreenState createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  File? image;

  Future pickImages(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Filed to image:$e"); // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("profile screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image.file(
                    image!,
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  )
                : FlutterLogo(
                    size: 160,
                  ),
            // Container(
            //   width: 160,
            //   height: 160,
            //   decoration: BoxDecoration(
            //     // color: Colors.red,
            //     image: DecorationImage(
            //       image: AssetImage("$image"),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: _screenSize.height / 30,
            ),
            Text(
              "Image Picker",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: _screenSize.height / 30,
            ),
            GestureDetector(
              onTap: () => pickImages(ImageSource.gallery),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 30,
                    ),
                    SizedBox(
                      width: _screenSize.width / 20,
                    ),
                    Text(
                      "Pic Gallery",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                height: _screenSize.height / 12,
                width: _screenSize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: _screenSize.height / 30,
            ),
            GestureDetector(
              onTap: () => pickImages(ImageSource.camera),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 30,
                    ),
                    SizedBox(
                      width: _screenSize.width / 20,
                    ),
                    Text(
                      "Pic Camera",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                height: _screenSize.height / 12,
                width: _screenSize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
