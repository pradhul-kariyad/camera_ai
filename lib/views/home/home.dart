// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  XFile? _imageFile;

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
      print("Camera image path: ${image.path}");
    } else {
      print("No image selected.");
    }
  }

  void _deleteImage() {
    setState(() {
      _imageFile = null;
    });
    print("Image deleted.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Camera",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => _openCamera(context),
            icon: const Icon(
              Icons.camera_alt_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _imageFile != null
              ? Expanded(
                  child: Image.file(
                    File(_imageFile!.path),
                    fit: BoxFit.cover,
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 310),
                  child: Center(
                    child: Text("No images"),
                  ),
                ),
        ],
      ),
      floatingActionButton: _imageFile != null
          ? FloatingActionButton(
              onPressed: _deleteImage,
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
