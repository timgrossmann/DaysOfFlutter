import 'dart:io';

import 'package:camera_n_library/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'imagedetail.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Future<List<FileSystemEntity>> _getAllImages() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/media';
    final myDir = Directory(dirPath);
    List<FileSystemEntity> images;

    // display newest images first
    images = myDir.listSync().reversed.toList();

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraScreen(),
          ),
        ),
        child: Icon(Icons.camera),
      ),
      body: FutureBuilder(
        future: _getAllImages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.data.isEmpty ||
              snapshot.data.length == 0) {
            return GridView.count(
              crossAxisCount: 3,
            );
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageDetail(snapshot.data[index].path),
                    )),
                child: Container(
                  height: 400,
                  padding: const EdgeInsets.all(5.0),
                  child: Image.file(
                    File(snapshot.data[index].path),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
