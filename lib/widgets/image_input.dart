import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  /// A property of type function which takes a file as an argument.
  /// 
  final void Function(File image) onPickImage;

  // ImageInput(this.onSelectImage);
  const ImageInput({Key? key, required this.onPickImage}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  /// Display a button that when taped will open the camera.
  /// When the camera is opened, the user can take a picture.
  /// The picture is then displayed in the app.
  /// The picture is then saved to the device.
  /// The picture is then displayed in the app.
  /// When the user taps the image, the user can replace the image with a new one.

  /// The image that the user has selected.
  File? _selectImage;

  /// Open the camera and take a picture.
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture~'),
      onPressed: _takePicture,
    );

    if (_selectImage != null) {
      /// Display the image that the user has selected.
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
