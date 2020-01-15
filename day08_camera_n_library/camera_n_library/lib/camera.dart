import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> _cameras;
  CameraController _controller;

  Future<void> _initCamera() async {
    _cameras = await availableCameras();

    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    _initCamera();
    
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _captureImage() async {
    if (_controller.value.isInitialized) {
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/media';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${_getUnixTimestamp()}.jpeg';
      await _controller.takePicture(filePath);

      // after the image is saved, jump back to the gallery
      Navigator.pop(context);

      setState(() {});
    }
  }

  int _getUnixTimestamp() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      height: 75.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 28.0,
            child: IconButton(
              icon: Icon(Icons.camera),
              color: Colors.white,
              onPressed: () {
                _captureImage();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    final size = MediaQuery.of(context).size;
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: _controller.value.aspectRatio / size.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CameraPreview(_controller),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Stack(
        children: <Widget>[
          _buildCameraPreview(),
        ],
      ),
    );
  }
}
