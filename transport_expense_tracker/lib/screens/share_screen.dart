import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Share1 extends StatefulWidget {
  static String routeName = '/share';
  @override
  State<Share1> createState() => _ShareState();
}

class _ShareState extends State<Share1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: TextButton(

          onPressed: () {
            final urlPreview= 'https://play.google.com/store/apps/details?id=com.example.my_plate';
            Share.share('Hey check out this cool app! \n\n$urlPreview'); },
          child: Text('Recommend our app to your friends'),
        ),
      ),
    );
  }
}
