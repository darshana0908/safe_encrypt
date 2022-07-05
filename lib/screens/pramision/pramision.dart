import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_encript/screens/colors/colors.dart';

import '../sign_signup/sign_and_signup.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 150),
              SvgPicture.asset(
                'assets/pramisson_1.svg',
                width: 150,
              ),
              const SizedBox(height: 100),
              Text(
                'Keepsafe needs access to  your file storage',
                style: TextStyle(fontSize: 25, color: kwhite),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
              Text(
                'this allows keepsafe to access and  encrypt your photos or videos.',
                style: TextStyle(fontSize: 17, color: kgray),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () async {
                  if (await Permission.storage.request().isGranted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignAndSignup()),
                    );
                    // Either the permission was already granted before or the user just granted it.
                  }

                  // You can request multiple permissions at once.
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.location,
                    Permission.storage,
                  ].request();
                  print(statuses[Permission.location]);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: kblue,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'GRANT ACCESS',
                    style: TextStyle(
                        fontSize: 17,
                        color: kwhite,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                child: const Text('EXIT'),
                onPressed: () {
                  exit(0);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
