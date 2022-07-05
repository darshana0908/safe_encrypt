import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safe_encript/screens/colors/colors.dart';

import '../pramision/pramision.dart';

class splashicon extends StatefulWidget {
  const splashicon({Key? key}) : super(key: key);

  @override
  State<splashicon> createState() => _splashiconState();
}

class _splashiconState extends State<splashicon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Permissions()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkblue,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/splash_girl.svg',
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
