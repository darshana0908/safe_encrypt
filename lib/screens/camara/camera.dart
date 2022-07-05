import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// CameraApp is the Main Application.
class Camera extends StatefulWidget {
  /// Default Constructor
  final List<CameraDescription>? cameras;
  const Camera({this.cameras, Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      // }).catchError((Object e) {
      //   if (e is CameraException) {
      //     switch (e.code) {
      //       case 'CameraAccessDenied':
      //         print('User denied camera access.');
      //         break;
      //       default:
      //         print('Handle other errors.');
      //         break;
      //     }
      //   }
    }
        //
        );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CameraPreview(controller),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Take Photo'),
        )
      ],
    );
  }
}
