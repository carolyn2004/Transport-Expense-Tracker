import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:transport_expense_tracker/screens/in_app_browser_page.dart';

class AppBrowser extends StatefulWidget {
  static String routeName = '/app-browser';

  @override
  State<AppBrowser> createState() => _AppBrowserState();
}

class _AppBrowserState extends State<AppBrowser> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Browser'),
       ),
       body: Container(
        child: TextButton(
          onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => InAppBrowserPage()));
          },
          child: Center(
           child: Text('Click here to view our recipes on youtube!'),
          )
        ),
    ),
     );
  }
}
