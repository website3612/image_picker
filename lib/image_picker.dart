// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImagePic extends StatefulWidget {
//   @override
//   _ImagePicState createState() => _ImagePicState();
// }
//
// class _ImagePicState extends State<ImagePic> {
//   late File _image;
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         print("${_image.path}");
//       } else {
//         print("no image selected");
//       }
//     });
//   }
//
//   Future<String> sendFile({required File avatar}) async {
//     MultipartFile multipartFile = await MultipartFile.fromFile(avatar.path);
//     var formData = new dio.FormData.fromMap({'avatar': multipartFile});
//
//     Response response = await Dio().post(
//         'https://codelineinfotech.com/student_api/User/user_avatar_upload.php',
//         data: formData,
//         options: Options(contentType: "form-data"));
//
//     print("avatar response: ${response.data}");
//     if (response.data['url'] != null) {
//       return response.data['url'];
//     } else {
//       return "";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("picker"),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: () async {
//             String imgUrl = await sendFile(avatar: _image);
//             print("button");
//           },
//           child: Container(
//             height: 400,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.red,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
