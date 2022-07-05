import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_encript/screens/colors/colors.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // File? image;

  final ImagePicker _picker = ImagePicker();

  String imagePath = '';

  // Future pickImage() async {
  //   final image = ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //   setState(() {

  //   });

  //   // final imageTemporary = File(image.path);
  //   // setState(() {
  //   //   this.image = imageTemporary;
  //   // });
  // }

  // Future takeImage() async {
  //   await ImagePicker().pickImage(source: ImageSource.camera);
  // }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('keepsafe'),
        backgroundColor: kdarkblue,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.account_circle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white54,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.cloud,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: HawkFabMenu(
          blur: 155.8,
          backgroundColor: kliteblue,
          openIcon: Icons.add,
          closeIcon: Icons.close,
          items: [
            HawkFabMenuItem(
                label: 'Add album',
                ontap: () async {
                  createFolder('Main Album');
                },
                icon: const Icon(Icons.add_to_photos_rounded),
                color: Colors.black38,
                labelColor: Colors.white,
                labelBackgroundColor: kliteblue),
            HawkFabMenuItem(
                label: 'Import photos',
                ontap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    setState(() {
                      imagePath = image.path;
                    });
                  }
                },
                icon: const Icon(
                  Icons.photo,
                ),
                color: const Color.fromRGBO(0, 0, 0, 0.38),
                labelColor: Colors.white,
                labelBackgroundColor: kliteblue),
            HawkFabMenuItem(
                label: 'Take photo',
                ontap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);

                  if (image != null) {
                    setState(() {
                      imagePath = image.path;
                    });
                  }
                },
                // ontap: () async {
                //   await availableCameras().then((value) => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (Context) => Camera(
                //                   cameras: value,
                //                 )),
                //       ));
                // },
                icon: const Icon(Icons.camera_alt),
                color: Colors.black38,
                labelColor: Colors.white,
                labelBackgroundColor: kliteblue),
          ],
          body: SizedBox(
            width: 200,
            child: imagePath != ''
                ? Image.file(File(imagePath))
                : const SizedBox(
                    width: 200,
                    height: 200,
                  ),

            // child: GridView.builder(
            //     itemCount: 5,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 4.0,
            //       mainAxisSpacing: 4.0,
            //     ),
            //     itemBuilder: (BuildContext context, int index) {
            //       return const PlatformAlbum();
            //     })
          ),
        ),
      ),
    );
  }

  Future<String> createFolder(String folderName) async {
    final path = Directory("storage/emulated/0/$folderName");
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await path.exists())) {
      return path.path;
    } else {
      path.create();
      return path.path;
    }
  }
}
