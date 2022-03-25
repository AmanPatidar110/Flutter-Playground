import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  // const ImageInput({ Key? key }) : super(key: key);
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePickture() async {
    try {
      final imgPicker = ImagePicker();
      final imageFile =
          await imgPicker.pickImage(source: ImageSource.camera, maxWidth: 600);

      if (imageFile == null) return;

      setState(() {
        _storedImage = File(imageFile.path);
      });
      final appDir = await sysPath.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      final savedImage =
          await File(imageFile.path).copy('${appDir.path}/$fileName');

      widget.onSelectImage(savedImage);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'Please upload an Image',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePickture,
            icon: Icon(Icons.camera),
            label: Text('Take Picture!'),
          ),
        ),
      ],
    );
  }
}
