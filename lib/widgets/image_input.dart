import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageInput extends StatefulWidget {
  // final Function onSelectImage;

  // ImageInput(this.onSelectImage);
  const ImageInput({Key? key}) : super(key: key);

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

  void _takePicture() {
    // todo:
  }

  @override
  Widget build(BuildContext context) {
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
      child: TextButton.icon(
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
        onPressed: () {
          // todo: open camera.
        },
      ),
    );
  }
}
