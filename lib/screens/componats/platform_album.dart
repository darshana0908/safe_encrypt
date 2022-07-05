import 'package:flutter/material.dart';
import '../colors/colors.dart';

class PlatformAlbum extends StatelessWidget {
  const PlatformAlbum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // color: kwhite,
        width: MediaQuery.of(context).size.width / 2 - 16,
        height: 230,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 16,
              height: 180,
              color: kindigo,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Main Album',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
