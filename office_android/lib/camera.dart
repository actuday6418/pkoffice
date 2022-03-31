import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:office_android/globals.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(color: secondaryBackground),
      FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: CameraPreview(_controller));
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator(color: accent));
          }
        },
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: accent,
              onPressed: () async {
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final capture = await _controller.takePicture();
                  image.image = capture;
                  image.isInitialised = true;
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
                Navigator.of(context).pop();
              },
              child: Icon(Icons.camera_alt, color: secondaryBackground),
            )),
      )
    ]));
  }
}
